'use client'

import { useActionState } from 'react'
import Link from 'next/link'
import { login } from '@/app/actions/auth'
import { Input } from '@/components/ui/Input'

const initialState = undefined

export function LoginForm() {
  const [state, formAction, pending] = useActionState(login, initialState)

  return (
    <form action={formAction} className="flex flex-col gap-5">
      {/* Logo mark */}
      <div className="text-center mb-2">
        <div className="font-serif text-3xl font-semibold text-ink tracking-tight">言の葉</div>
        <div className="text-xs text-muted tracking-widest uppercase mt-1">Koto no Ha</div>
      </div>

      <div>
        <h1 className="text-xl font-semibold text-ink font-serif">Selamat datang kembali</h1>
        <p className="text-sm text-muted mt-1">Masuk untuk melanjutkan belajar</p>
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
        placeholder="••••••••"
        autoComplete="current-password"
        required
      />

      <button
        type="submit"
        disabled={pending}
        className="w-full rounded-lg bg-ink text-paper py-3 text-sm font-medium
          hover:opacity-90 transition-opacity disabled:opacity-50 disabled:cursor-not-allowed"
      >
        {pending ? 'Memproses...' : 'Masuk'}
      </button>

      <p className="text-center text-sm text-muted">
        Belum punya akun?{' '}
        <Link href="/register" className="text-ink font-medium hover:underline">
          Daftar gratis
        </Link>
      </p>
    </form>
  )
}
