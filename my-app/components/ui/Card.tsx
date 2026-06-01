import React from 'react'

interface CardProps {
  children: React.ReactNode
  className?: string
  hover?: boolean
}

export function Card({ children, className = '', hover = false }: CardProps) {
  return (
    <div
      className={`
        bg-surface border border-[var(--border)] rounded-xl
        ${hover ? 'transition-transform duration-200 hover:-translate-y-1 hover:shadow-[var(--shadow-card)]' : ''}
        ${className}
      `}
    >
      {children}
    </div>
  )
}
