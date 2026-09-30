-- 059: Skema paywall — products, orders, payments, entitlements, admin_audit_log (T4 sprint launch).
--
-- Rancangan: docs/launch-12okt/PLAN.md §3.
--   * Klien (anon/authenticated) TIDAK PERNAH menulis orders/payments/entitlements/admin_audit_log.
--     Semua tulisan lewat route server dengan service role (/api/checkout, /api/xendit/webhook, /admin).
--   * User hanya bisa MEMBACA order & entitlement miliknya sendiri (dipakai halaman akun + Realtime).
--   * Hak akses konten dicek dari entitlements (expires_at NULL = selamanya untuk PDF),
--     BUKAN dari profiles.is_premium / kolom is_premium di tabel konten.
--   * profiles.role hanya bisa diubah lewat SQL (tidak ada GRANT UPDATE ke klien).
--   * Nomor 058 dipakai PR konten #24, jadi migrasi ini 059.
--
-- Idempoten: aman dijalankan ulang.

-- ─── 0. Helper updated_at ─────────────────────────────────────────────────────
CREATE OR REPLACE FUNCTION public.set_updated_at()
 RETURNS trigger
 LANGUAGE plpgsql
 SET search_path TO ''
AS $$
begin
  new.updated_at := now();
  return new;
end;
$$;

-- ─── 1. profiles: role + WhatsApp (dengan persetujuan) ───────────────────────
ALTER TABLE public.profiles
  ADD COLUMN IF NOT EXISTS role text NOT NULL DEFAULT 'user',
  ADD COLUMN IF NOT EXISTS whatsapp text,
  ADD COLUMN IF NOT EXISTS whatsapp_consent_at timestamptz;

DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'profiles_role_check') THEN
    ALTER TABLE public.profiles ADD CONSTRAINT profiles_role_check CHECK (role IN ('user', 'admin'));
  END IF;
  -- Format E.164 Indonesia: +62 diikuti 8–13 digit.
  IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'profiles_whatsapp_format') THEN
    ALTER TABLE public.profiles ADD CONSTRAINT profiles_whatsapp_format
      CHECK (whatsapp IS NULL OR whatsapp ~ '^\+62[0-9]{8,13}$');
  END IF;
  -- Nomor WA hanya boleh tersimpan bila ada persetujuan.
  IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'profiles_whatsapp_consent') THEN
    ALTER TABLE public.profiles ADD CONSTRAINT profiles_whatsapp_consent
      CHECK (whatsapp IS NULL OR whatsapp_consent_at IS NOT NULL);
  END IF;
END $$;

-- Waktu persetujuan diisi server (now()), bukan nilai kiriman klien.
-- Menghapus nomor WA juga menghapus waktu persetujuan.
CREATE OR REPLACE FUNCTION public.profiles_whatsapp_consent_stamp()
 RETURNS trigger
 LANGUAGE plpgsql
 SET search_path TO ''
AS $$
begin
  if new.whatsapp is null then
    new.whatsapp_consent_at := null;
  elsif new.whatsapp_consent_at is not null
        and (tg_op = 'INSERT' or old.whatsapp_consent_at is null
             or new.whatsapp_consent_at is distinct from old.whatsapp_consent_at
             or new.whatsapp is distinct from old.whatsapp) then
    new.whatsapp_consent_at := now();
  end if;
  return new;
end;
$$;

DROP TRIGGER IF EXISTS profiles_whatsapp_consent_stamp ON public.profiles;
CREATE TRIGGER profiles_whatsapp_consent_stamp
  BEFORE INSERT OR UPDATE OF whatsapp, whatsapp_consent_at ON public.profiles
  FOR EACH ROW EXECUTE FUNCTION public.profiles_whatsapp_consent_stamp();

-- 057 membatasi UPDATE ke kolom identitas; tambahkan kolom WA. role TIDAK di-grant.
GRANT UPDATE (whatsapp, whatsapp_consent_at) ON public.profiles TO authenticated;

-- Dipakai layout/route /admin (T10). Membaca role milik pemanggil saja.
CREATE OR REPLACE FUNCTION public.is_admin()
 RETURNS boolean
 LANGUAGE sql
 STABLE
 SECURITY DEFINER
 SET search_path TO ''
AS $$
  select coalesce((select p.role = 'admin' from public.profiles p where p.id = auth.uid()), false);
$$;
REVOKE EXECUTE ON FUNCTION public.is_admin() FROM PUBLIC, anon;
GRANT EXECUTE ON FUNCTION public.is_admin() TO authenticated, service_role;

-- ─── 2. products ─────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS public.products (
  id            text PRIMARY KEY CHECK (id ~ '^[a-z0-9][a-z0-9-]{1,63}$'),  -- slug, mis. 'pdf-n5', 'video-bulanan'
  kind          text NOT NULL CHECK (kind IN ('pdf', 'video_sub')),
  title         text NOT NULL,
  description   text,
  level         text CHECK (level IS NULL OR level IN ('N5', 'N4', 'N3', 'N2', 'N1')),
  price_idr     integer NOT NULL CHECK (price_idr >= 1000),
  access_days   integer CHECK (access_days IS NULL OR access_days > 0),  -- NULL = selamanya
  storage_path  text,          -- PDF: path di bucket privat 'produk-pdf' (tidak dibuka ke klien)
  sort_order    integer NOT NULL DEFAULT 0,
  is_active     boolean NOT NULL DEFAULT false,
  created_at    timestamptz NOT NULL DEFAULT now(),
  updated_at    timestamptz NOT NULL DEFAULT now(),
  CONSTRAINT products_kind_access CHECK (
    (kind = 'pdf' AND access_days IS NULL) OR (kind = 'video_sub' AND access_days IS NOT NULL)
  )
);

DROP TRIGGER IF EXISTS products_updated_at ON public.products;
CREATE TRIGGER products_updated_at BEFORE UPDATE ON public.products
  FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();

ALTER TABLE public.products ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Produk aktif bisa dibaca publik" ON public.products;
CREATE POLICY "Produk aktif bisa dibaca publik" ON public.products
  FOR SELECT TO anon, authenticated USING (is_active);

REVOKE ALL ON public.products FROM PUBLIC, anon, authenticated;
-- storage_path sengaja tidak di-grant: klien harus memilih kolom secara eksplisit.
GRANT SELECT (id, kind, title, description, level, price_idr, access_days, sort_order, is_active)
  ON public.products TO anon, authenticated;

-- ─── 3. orders ───────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS public.orders (
  id                  uuid PRIMARY KEY DEFAULT gen_random_uuid(),  -- = external_id di Xendit
  -- Nullable + SET NULL: catatan transaksi tetap ada (akuntansi) saat akun dihapus (UU PDP).
  user_id             uuid REFERENCES auth.users(id) ON DELETE SET NULL,
  product_id          text NOT NULL REFERENCES public.products(id) ON DELETE RESTRICT,
  amount_idr          integer NOT NULL CHECK (amount_idr >= 1000),  -- dikunci saat checkout
  status              text NOT NULL DEFAULT 'pending'
                        CHECK (status IN ('pending', 'paid', 'expired', 'failed', 'refunded')),
  xendit_invoice_id   text UNIQUE,
  xendit_invoice_url  text,
  payment_method      text,
  payment_channel     text,
  paid_at             timestamptz,
  invoice_expires_at  timestamptz,
  created_at          timestamptz NOT NULL DEFAULT now(),
  updated_at          timestamptz NOT NULL DEFAULT now(),
  CONSTRAINT orders_paid_has_time CHECK (status <> 'paid' OR paid_at IS NOT NULL)
);

CREATE INDEX IF NOT EXISTS orders_user_created ON public.orders (user_id, created_at DESC);
CREATE INDEX IF NOT EXISTS orders_status_created ON public.orders (status, created_at DESC);

DROP TRIGGER IF EXISTS orders_updated_at ON public.orders;
CREATE TRIGGER orders_updated_at BEFORE UPDATE ON public.orders
  FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();

ALTER TABLE public.orders ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "User membaca order sendiri" ON public.orders;
CREATE POLICY "User membaca order sendiri" ON public.orders
  FOR SELECT TO authenticated USING ((select auth.uid()) = user_id);

REVOKE ALL ON public.orders FROM PUBLIC, anon, authenticated;
GRANT SELECT ON public.orders TO authenticated;

-- ─── 4. payments (log mentah webhook; hanya server) ─────────────────────────
CREATE TABLE IF NOT EXISTS public.payments (
  id                 bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  order_id           uuid REFERENCES public.orders(id) ON DELETE SET NULL,
  webhook_id         text UNIQUE,   -- header 'webhook-id' Xendit → cegah proses ganda
  xendit_invoice_id  text,
  status             text,
  amount_idr         integer,
  payload            jsonb NOT NULL,
  outcome            text NOT NULL DEFAULT 'received'
                       CHECK (outcome IN ('received', 'applied', 'duplicate', 'rejected', 'error')),
  error              text,
  received_at        timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS payments_order ON public.payments (order_id);
CREATE INDEX IF NOT EXISTS payments_received ON public.payments (received_at DESC);

ALTER TABLE public.payments ENABLE ROW LEVEL SECURITY;
-- Tanpa policy: hanya service role.
REVOKE ALL ON public.payments FROM PUBLIC, anon, authenticated;

-- ─── 5. entitlements ─────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS public.entitlements (
  id          uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id     uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  product_id  text NOT NULL REFERENCES public.products(id) ON DELETE RESTRICT,
  order_id    uuid UNIQUE REFERENCES public.orders(id) ON DELETE SET NULL,  -- 1 order = 1 hak akses
  source      text NOT NULL CHECK (source IN ('purchase', 'admin')),
  starts_at   timestamptz NOT NULL DEFAULT now(),
  expires_at  timestamptz,       -- NULL = selamanya (PDF)
  revoked_at  timestamptz,
  created_at  timestamptz NOT NULL DEFAULT now(),
  CONSTRAINT entitlements_window CHECK (expires_at IS NULL OR expires_at > starts_at)
);

CREATE INDEX IF NOT EXISTS entitlements_user_product ON public.entitlements (user_id, product_id, expires_at DESC);

ALTER TABLE public.entitlements ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "User membaca hak akses sendiri" ON public.entitlements;
CREATE POLICY "User membaca hak akses sendiri" ON public.entitlements
  FOR SELECT TO authenticated USING ((select auth.uid()) = user_id);

REVOKE ALL ON public.entitlements FROM PUBLIC, anon, authenticated;
GRANT SELECT ON public.entitlements TO authenticated;

-- Cek hak akses milik pemanggil (SECURITY INVOKER → tetap tunduk RLS).
CREATE OR REPLACE FUNCTION public.has_entitlement(p_product_id text)
 RETURNS boolean
 LANGUAGE sql
 STABLE
 SET search_path TO ''
AS $$
  select exists (
    select 1 from public.entitlements e
    where e.user_id = auth.uid()
      and e.product_id = p_product_id
      and e.revoked_at is null
      and e.starts_at <= now()
      and (e.expires_at is null or e.expires_at > now())
  );
$$;
REVOKE EXECUTE ON FUNCTION public.has_entitlement(text) FROM PUBLIC, anon;
GRANT EXECUTE ON FUNCTION public.has_entitlement(text) TO authenticated;

-- ─── 6. Penerapan pembayaran (atomik + idempoten; HANYA service role) ────────
-- Dipanggil /api/xendit/webhook (T5) SETELAH x-callback-token diverifikasi.
-- Mengembalikan: 'applied' | 'duplicate' | 'not_found' | 'amount_mismatch' | 'invoice_mismatch'.
-- Langganan video diperpanjang dari tanggal habis yang masih aktif (tidak hangus bila bayar lebih awal).
CREATE OR REPLACE FUNCTION public.apply_paid_order(
  p_order_id          uuid,
  p_xendit_invoice_id text,
  p_amount_idr        integer,
  p_paid_at           timestamptz DEFAULT now(),
  p_payment_method    text DEFAULT NULL,
  p_payment_channel   text DEFAULT NULL
)
 RETURNS text
 LANGUAGE plpgsql
 SECURITY DEFINER
 SET search_path TO ''
AS $$
declare
  v_order   public.orders%rowtype;
  v_days    integer;
  v_start   timestamptz;
  v_expires timestamptz;
begin
  select * into v_order from public.orders o where o.id = p_order_id for update;
  if not found or v_order.user_id is null then
    return 'not_found';
  end if;
  if v_order.status = 'paid' then
    return 'duplicate';
  end if;
  if v_order.xendit_invoice_id is not null and v_order.xendit_invoice_id <> p_xendit_invoice_id then
    return 'invoice_mismatch';
  end if;
  if p_amount_idr is distinct from v_order.amount_idr then
    return 'amount_mismatch';
  end if;

  update public.orders o
  set status = 'paid',
      paid_at = coalesce(p_paid_at, now()),
      xendit_invoice_id = p_xendit_invoice_id,
      payment_method = p_payment_method,
      payment_channel = p_payment_channel
  where o.id = p_order_id;

  select pr.access_days into v_days from public.products pr where pr.id = v_order.product_id;

  if v_days is null then
    v_start := now();
    v_expires := null;
  else
    select greatest(now(), coalesce(max(e.expires_at), now())) into v_start
    from public.entitlements e
    where e.user_id = v_order.user_id and e.product_id = v_order.product_id
      and e.revoked_at is null and e.expires_at is not null;
    v_expires := v_start + make_interval(days => v_days);
    v_start := now();
  end if;

  insert into public.entitlements (user_id, product_id, order_id, source, starts_at, expires_at)
  values (v_order.user_id, v_order.product_id, v_order.id, 'purchase', v_start, v_expires)
  on conflict (order_id) do nothing;

  return 'applied';
end;
$$;
REVOKE EXECUTE ON FUNCTION public.apply_paid_order(uuid, text, integer, timestamptz, text, text)
  FROM PUBLIC, anon, authenticated;
GRANT EXECUTE ON FUNCTION public.apply_paid_order(uuid, text, integer, timestamptz, text, text)
  TO service_role;

-- ─── 7. admin_audit_log (hanya server) ───────────────────────────────────────
CREATE TABLE IF NOT EXISTS public.admin_audit_log (
  id               bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  admin_id         uuid REFERENCES auth.users(id) ON DELETE SET NULL,
  action           text NOT NULL,   -- mis. 'grant_entitlement', 'revoke_entitlement', 'mark_refunded'
  target_user_id   uuid REFERENCES auth.users(id) ON DELETE SET NULL,
  target_order_id  uuid REFERENCES public.orders(id) ON DELETE SET NULL,
  details          jsonb NOT NULL DEFAULT '{}'::jsonb,
  created_at       timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS admin_audit_log_created ON public.admin_audit_log (created_at DESC);

ALTER TABLE public.admin_audit_log ENABLE ROW LEVEL SECURITY;
REVOKE ALL ON public.admin_audit_log FROM PUBLIC, anon, authenticated;

-- Log audit hanya boleh ditambah, tidak diubah/dihapus (termasuk oleh service role),
-- kecuali FK yang di-NULL-kan otomatis saat akun dihapus.
CREATE OR REPLACE FUNCTION public.admin_audit_log_append_only()
 RETURNS trigger
 LANGUAGE plpgsql
 SET search_path TO ''
AS $$
begin
  -- Pengecualian: FK ON DELETE SET NULL saat akun dihapus (hanya kolom referensi yang berubah).
  if tg_op = 'UPDATE'
     and new.id = old.id and new.action = old.action and new.details = old.details
     and new.created_at = old.created_at then
    return new;
  end if;
  raise exception 'admin_audit_log bersifat append-only';
end;
$$;
DROP TRIGGER IF EXISTS admin_audit_log_append_only ON public.admin_audit_log;
CREATE TRIGGER admin_audit_log_append_only BEFORE UPDATE OR DELETE ON public.admin_audit_log
  FOR EACH ROW EXECUTE FUNCTION public.admin_audit_log_append_only();

-- ─── 8. Hak service role (eksplisit) ─────────────────────────────────────────
GRANT ALL ON public.products, public.orders, public.payments, public.entitlements, public.admin_audit_log
  TO service_role;

-- ─── 9. Bucket PDF privat (unduhan lewat route server + signed URL, T6) ─────
INSERT INTO storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
VALUES ('produk-pdf', 'produk-pdf', false, 104857600, ARRAY['application/pdf'])
ON CONFLICT (id) DO UPDATE SET public = false;
-- Tanpa policy storage.objects untuk bucket ini → hanya service role yang bisa baca/tulis.

-- ─── 10. Realtime: akses terbuka tanpa logout/login ulang ───────────────────
-- RLS SELECT di atas membatasi event ke baris milik user sendiri.
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_publication_tables
    WHERE pubname = 'supabase_realtime' AND schemaname = 'public' AND tablename = 'entitlements'
  ) THEN
    ALTER PUBLICATION supabase_realtime ADD TABLE public.entitlements;
  END IF;
  IF NOT EXISTS (
    SELECT 1 FROM pg_publication_tables
    WHERE pubname = 'supabase_realtime' AND schemaname = 'public' AND tablename = 'orders'
  ) THEN
    ALTER PUBLICATION supabase_realtime ADD TABLE public.orders;
  END IF;
END $$;

-- Produk (harga) BELUM di-seed: menunggu keputusan harga dari Zilsa.
-- Contoh setelah harga final:
--   INSERT INTO public.products (id, kind, title, level, price_idr, access_days, storage_path, sort_order, is_active)
--   VALUES ('pdf-n5', 'pdf', 'PDF Materi N5', 'N5', 79000, NULL, 'n5/materi-n5.pdf', 10, true),
--          ('video-bulanan', 'video_sub', 'Video Kelas (30 hari)', NULL, 49000, 30, NULL, 100, true);
