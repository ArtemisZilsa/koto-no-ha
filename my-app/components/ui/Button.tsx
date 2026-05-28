import React from 'react'
import Link from 'next/link'

type ButtonVariant = 'solid' | 'ghost' | 'hero' | 'hero-outline' | 'cta'
type ButtonSize = 'sm' | 'md' | 'lg'

interface ButtonBaseProps {
  variant?: ButtonVariant
  size?: ButtonSize
  className?: string
  children: React.ReactNode
}

interface ButtonAsButtonProps extends ButtonBaseProps {
  as?: 'button'
  href?: never
  type?: 'button' | 'submit' | 'reset'
  disabled?: boolean
  onClick?: () => void
}

interface ButtonAsLinkProps extends ButtonBaseProps {
  as: 'link'
  href: string
  type?: never
  disabled?: never
  onClick?: never
}

type ButtonProps = ButtonAsButtonProps | ButtonAsLinkProps

const variantClasses: Record<ButtonVariant, string> = {
  solid:
    'bg-ink text-paper border border-transparent hover:opacity-85 transition-opacity',
  ghost:
    'bg-transparent text-ink border border-[rgba(13,13,18,0.1)] hover:bg-paper-dark transition-colors',
  hero:
    'bg-ink text-paper border-none hover:opacity-90 hover:-translate-y-px transition-all font-medium',
  'hero-outline':
    'bg-transparent text-ink border border-[rgba(13,13,18,0.1)] hover:bg-paper-dark transition-colors inline-flex items-center gap-2',
  cta:
    'bg-paper text-ink border-none hover:opacity-90 transition-opacity font-medium',
}

const sizeClasses: Record<ButtonSize, string> = {
  sm: 'text-[13px] px-4 py-[7px]',
  md: 'text-sm px-[18px] py-[10px]',
  lg: 'text-sm px-[30px] py-[13px]',
}

export function Button({
  variant = 'solid',
  size = 'md',
  className = '',
  children,
  ...props
}: ButtonProps) {
  const base = `inline-block rounded-lg cursor-pointer font-[family-name:var(--font-sans)] ${variantClasses[variant]} ${sizeClasses[size]} ${className}`

  if (props.as === 'link') {
    return (
      <Link href={props.href} className={base}>
        {children}
      </Link>
    )
  }

  return (
    <button
      type={props.type ?? 'button'}
      disabled={props.disabled}
      onClick={props.onClick}
      className={base}
    >
      {children}
    </button>
  )
}
