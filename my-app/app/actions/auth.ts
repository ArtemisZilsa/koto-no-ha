'use server'

import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'

type AuthState = { error?: string; message?: string } | undefined

export async function login(prevState: AuthState, formData: FormData) {
  const email = formData.get('email') as string
  const password = formData.get('password') as string

  if (!email || !password) {
    return { error: 'Email dan password wajib diisi.' }
  }

  const supabase = await createClient()
  const { error } = await supabase.auth.signInWithPassword({ email, password })

  if (error) {
    if (error.code === 'email_not_confirmed') {
      return { error: 'Email belum dikonfirmasi. Cek tautan konfirmasi di emailmu.' }
    }
    return { error: 'Email atau password salah. Silakan coba lagi.' }
  }

  redirect('/dashboard')
}

export async function register(prevState: AuthState, formData: FormData) {
  const email = formData.get('email') as string
  const password = formData.get('password') as string
  const confirm = formData.get('confirm') as string

  if (!email || !password || !confirm) {
    return { error: 'Semua kolom wajib diisi.' }
  }

  if (password !== confirm) {
    return { error: 'Password tidak cocok. Silakan coba lagi.' }
  }

  if (password.length < 6) {
    return { error: 'Password minimal 6 karakter.' }
  }

  const supabase = await createClient()
  const { data, error } = await supabase.auth.signUp({ email, password })

  if (error) {
    if (error.message.includes('already registered') || error.code === 'user_already_exists') {
      return { error: 'Email ini sudah terdaftar. Silakan login.' }
    }
    if (error.code === 'over_email_send_rate_limit') {
      return { error: 'Terlalu banyak percobaan. Tunggu sebentar lalu coba lagi.' }
    }
    return { error: 'Pendaftaran gagal. Silakan coba lagi.' }
  }

  // Jika "Confirm email" masih aktif di Supabase, signUp tidak membuat session.
  // Jangan redirect ke /dashboard (akan dilempar balik ke /login) — beri tahu user.
  if (!data.session) {
    return {
      message:
        'Akun dibuat! Cek email kamu untuk tautan konfirmasi, lalu masuk lewat halaman Login.',
    }
  }

  redirect('/dashboard')
}

export async function logout() {
  const supabase = await createClient()
  await supabase.auth.signOut()
  redirect('/')
}
