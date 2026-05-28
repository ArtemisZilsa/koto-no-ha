'use client'

import React from 'react'

interface InputProps extends React.InputHTMLAttributes<HTMLInputElement> {
  label?: string
  error?: string
  id: string
}

export function Input({ label, error, id, className = '', ...props }: InputProps) {
  return (
    <div className="flex flex-col gap-1.5">
      {label && (
        <label
          htmlFor={id}
          className="text-[13px] font-medium text-[var(--text)]"
        >
          {label}
        </label>
      )}
      <input
        id={id}
        className={`
          w-full rounded-lg border px-4 py-3 text-[14px]
          bg-white text-[var(--text)] placeholder:text-[var(--muted)]
          outline-none transition-colors
          border-[rgba(13,13,18,0.15)]
          focus:border-[var(--ink)] focus:ring-2 focus:ring-[rgba(13,13,18,0.08)]
          ${error ? 'border-[var(--red)] focus:border-[var(--red)] focus:ring-[rgba(200,16,46,0.1)]' : ''}
          ${className}
        `}
        {...props}
      />
      {error && (
        <p className="text-[12px] text-[var(--red)]">{error}</p>
      )}
    </div>
  )
}
