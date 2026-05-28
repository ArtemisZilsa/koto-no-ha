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
        bg-white border border-[rgba(13,13,18,0.1)] rounded-xl
        ${hover ? 'transition-transform duration-200 hover:-translate-y-1 hover:shadow-[0_10px_28px_rgba(13,13,18,0.07)]' : ''}
        ${className}
      `}
    >
      {children}
    </div>
  )
}
