import { createContext, useContext } from 'react'
import type { ReactNode } from 'react'
import { useQuery } from '@tanstack/react-query'
import { supabase } from '@/services/supabase/client'
import { useTenant } from './TenantProvider'
import { Loader2 } from 'lucide-react'

export interface CompanyConfig {
    id: string
    nombre_comercial: string
    moneda_base: string
}

const CompanyContext = createContext<CompanyConfig | undefined>(undefined)

export function CompanyProvider({ children }: { children: ReactNode }) {
    const { activeTenantId } = useTenant()

    const { data: company, isLoading } = useQuery({
        queryKey: ['company_config', activeTenantId],
        enabled: !!activeTenantId,
        queryFn: async () => {
            const { data, error } = await supabase
                .from('empresas')
                .select('*')
                .eq('id', activeTenantId as string)
                .single()

            if (error) throw error
            return data as CompanyConfig
        },
        staleTime: 1000 * 60 * 60,
    })

    if (isLoading) {
        return (
            <div className="min-h-screen bg-zinc-50 flex flex-col items-center justify-center space-y-4">
                <Loader2 className="h-8 w-8 animate-spin text-emerald-600" />
                <p className="text-sm font-medium text-zinc-500 animate-pulse">Cargando configuraciones...</p>
            </div>
        )
    }

    return (
        <CompanyContext.Provider value={company || undefined}>
            {children}
        </CompanyContext.Provider>
    )
}

export function useCompany() {
    const context = useContext(CompanyContext)
    if (!context) throw new Error('useCompany debe usarse dentro de CompanyProvider')
    return context
}