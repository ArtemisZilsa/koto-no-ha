'use client'

import { useActionState } from 'react'
import Link from 'next/link'
import { register } from '@/app/actions/auth'
import { Input } from '@/components/ui/Input'

const initialState = undefined

export function RegisterForm() {
  const [state, formAction, pending] = useActionState(register, initialState)

  return (
    <form action={formAction} className="flex flex-col gap-5">
      {/* Logo mark */}
      <div className="text-center mb-2">
        <div className="font-serif text-3xl font-semibold text-ink tracking-tight">言の葉</div>
        <div className="text-xs text-muted tracking-widest uppercase mt-1">Koto no Ha</div>
      </div>

      <div>
        <h1 className="text-xl font-semibold text-ink font-serif">Mulai belajar gratis</h1>
        <p className="text-sm text-muted mt-1">Buat akun dan mulai perjalanan bahasa Jepangmu</p>
      </div>

      {state?.error && (
        <div className="rounded-lg bg-red-bg border border-[rgba(200,16,46,0.2)] px-4 py-3 text-sm text-brand-red">
          {state.error}
        </div>
      )}

      <Input
        id="email"
        name="email"
        type="email"
        label="Email"
        placeholder="namamu@email.com"
        autoComplete="email"
        required
      />

      <Input
        id="password"
        name="password"
        type="password"
        label="Password"
        placeholder="Minimal 6 karakter"
        autoComplete="new-password"
        required
      />

      <Input
        id="confirm"
        name="confirm"
        type="password"
        label="Konfirmasi Password"
        placeholder="Ulangi password"
        autoComplete="new-password"
        required
      />

      <button
        type="submit"
        disabled={pending}
        className="w-full rounded-lg bg-ink text-paper py-3 text-sm font-medium
          hover:opacity-90 transition-opacity disabled:opacity-50 disabled:cursor-not-allowed"
      >
        {pending ? 'Membuat akun...' : 'Daftar Sekarang — Gratis'}
      </button>

      <p className="text-center text-sm text-muted">
        Sudah punya akun?{' '}
        <Link href="/login" className="text-ink font-medium hover:underline">
          Masuk di sini
        </Link>
      </p>
    </form>
  )
}
