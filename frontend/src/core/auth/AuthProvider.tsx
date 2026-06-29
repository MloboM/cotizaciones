import { createContext, useEffect, useState } from 'react'
import type { ReactNode } from 'react'
import type { Session, User } from '@supabase/supabase-js' // MAGIA: import type
import { supabase } from '@/services/supabase/client'

export interface AuthContextType {
    session: Session | null
    user: User | null
    loading: boolean
}

export const AuthContext = createContext<AuthContextType | undefined>(undefined)

export function AuthProvider({ children }: { children: ReactNode }) {
    const [session, setSession] = useState<Session | null>(null)
    const [loading, setLoading] = useState(true)

    useEffect(() => {
        supabase.auth.getSession().then(({ data: { session } }) => {
            setSession(session)
            setLoading(false)
        })

        const { data: { subscription } } = supabase.auth.onAuthStateChange((_event, session) => {
            setSession(session)
            setLoading(false)
        })

        return () => subscription.unsubscribe()
    }, [])

    return (
        <AuthContext.Provider value={{ session, user: session?.user ?? null, loading }}>
            {children}
        </AuthContext.Provider>
    )
}