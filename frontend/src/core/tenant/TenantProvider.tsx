import { createContext, useContext, useEffect, useState } from 'react'
import type { ReactNode } from 'react'
import { useQuery } from '@tanstack/react-query'
import { supabase } from '@/services/supabase/client'
import { useAuth } from '@/core/auth/useAuth'
import { Loader2 } from 'lucide-react'
import { useLogout } from '@/core/auth/useLogout' // ✅ Nuevo import

export interface AllowedTenant {
    empresa_id: string
    rol: string
    nombre_comercial: string
}

interface TenantContextType {
    activeTenantId: string | null
    activeRole: string | null
    allowedTenants: AllowedTenant[]
    switchTenant: (empresaId: string) => void
}

const TenantContext = createContext<TenantContextType | undefined>(undefined)

export function TenantProvider({ children }: { children: ReactNode }) {
    const { user } = useAuth()
    const [activeTenantId, setActiveTenantId] = useState<string | null>(null)

    // ✅ Extraemos la función de logout para usarla en nuestro botón de escape
    const { logout } = useLogout()

    const { data: allowedTenants = [], isLoading } = useQuery({
        queryKey: ['allowedTenants', user?.id],
        enabled: !!user?.id,
        queryFn: async () => {
            const { data, error } = await supabase
                .from('perfiles')
                .select('empresa_id, rol, empresas ( nombre_comercial )')
                .eq('id', user?.id)

            if (error) throw error

            return (data || []).filter(row => row.empresa_id).map(row => {
                const empresa = Array.isArray(row.empresas) ? row.empresas[0] : row.empresas
                return {
                    empresa_id: row.empresa_id as string,
                    rol: row.rol,
                    nombre_comercial: empresa?.nombre_comercial || 'Empresa Desconocida'
                }
            }) as AllowedTenant[]
        },
        staleTime: 1000 * 60 * 30,
    })

    useEffect(() => {
        if (allowedTenants.length > 0 && !activeTenantId) {
            setActiveTenantId(allowedTenants[0].empresa_id)
        }
    }, [allowedTenants, activeTenantId])

    const switchTenant = (empresaId: string) => {
        if (allowedTenants.some(t => t.empresa_id === empresaId)) {
            setActiveTenantId(empresaId)
        }
    }

    if (isLoading || (allowedTenants.length > 0 && !activeTenantId)) {
        return (
            <div className="min-h-screen flex flex-col items-center justify-center bg-zinc-50 space-y-4">
                <Loader2 className="h-8 w-8 animate-spin text-emerald-600" />
                <p className="text-sm font-medium text-zinc-500 animate-pulse">Cargando entorno de trabajo...</p>
            </div>
        )
    }

    if (!isLoading && allowedTenants.length === 0) {
        return (
            <div className="min-h-screen bg-zinc-50 flex items-center justify-center p-4">
                {/* 🔴 Bloque actualizado de Acceso Denegado con Botón de Escape */}
                <div className="bg-white p-8 rounded-xl border border-red-200 text-center max-w-md shadow-sm w-full">
                    <h2 className="text-xl font-bold text-red-600">Acceso Denegado</h2>
                    <p className="text-zinc-600 mt-3 text-sm">
                        Tu usuario no tiene ninguna empresa asignada o no tienes permisos para verla.
                    </p>
                    <button
                        onClick={logout}
                        className="mt-6 px-4 py-2 bg-red-50 text-red-600 rounded-md hover:bg-red-100 font-medium text-sm transition-colors w-full"
                    >
                        Cerrar Sesión y Actualizar
                    </button>
                </div>
            </div>
        )
    }

    const activeRole = allowedTenants.find(t => t.empresa_id === activeTenantId)?.rol || null

    return (
        <TenantContext.Provider value={{ activeTenantId, activeRole, allowedTenants, switchTenant }}>
            {children}
        </TenantContext.Provider>
    )
}

export function useTenant() {
    const context = useContext(TenantContext)
    if (!context) throw new Error('useTenant debe usarse dentro de TenantProvider')
    return context
}