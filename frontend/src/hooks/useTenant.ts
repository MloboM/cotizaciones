import { useEffect, useState } from "react"
import { supabase } from "@/services/supabase/client"

export function useTenant() {
    const [empresaId, setEmpresaId] = useState<string | null>(null)
    const [loadingTenant, setLoadingTenant] = useState(true)

    useEffect(() => {
        const getDynamicTenant = async () => {
            setLoadingTenant(true)
            try {
                // 1. Recuperamos el usuario autenticado directamente desde la sesión segura de Supabase
                const { data: { user }, error: userError } = await supabase.auth.getUser()
                if (userError) throw userError

                if (user) {
                    // Estrategia A: Intentar leerlo desde los metadatos del JWT (Súper rápido y eficiente)
                    const tokenTenantId = user.user_metadata?.empresa_id || user.app_metadata?.empresa_id

                    if (tokenTenantId) {
                        setEmpresaId(tokenTenantId)
                    } else {
                        // Estrategia B: Si no está en el token, lo consultamos en la tabla de usuarios del esquema público
                        const { data: perfilData, error: perfilError } = await supabase
                            .from("perfiles")
                            .select("empresa_id")
                            .eq("id", user.id)
                            .single()

                        if (!perfilError && perfilData) {
                            setEmpresaId(perfilData.empresa_id)
                        }
                    }
                }
            } catch (error) {
                console.error("Error crítico al resolver el empresa_id dinámico:", error)
            } finally {
                setLoadingTenant(false)
            }
        }

        getDynamicTenant()
    }, [])

    return { empresaId, loadingTenant }
}