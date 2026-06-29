import { Navigate, useLocation } from 'react-router-dom'
import type { ReactNode } from 'react'
import { useAuth } from './useAuth'
import { Loader2 } from 'lucide-react'

interface AuthGateProps {
    children: ReactNode
}

export function AuthGate({ children }: AuthGateProps) {
    const { user, loading } = useAuth()
    const location = useLocation()

    if (loading) {
        return (
            <div className="min-h-screen flex items-center justify-center bg-zinc-50">
                <Loader2 className="h-8 w-8 animate-spin text-emerald-600" />
            </div>
        )
    }

    if (!user) {
        return <Navigate to="/login" state={{ from: location }} replace />
    }

    return <>{children}</>
}