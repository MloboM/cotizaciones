import type { ReactNode } from 'react'
// ✅ Importamos de forma segura usando el alias '@' que apunta a 'src/'
import { useTenant } from '@/core/tenant/TenantProvider'

interface RBACGuardProps {
    allowedRoles: string[]
    children: ReactNode
}

export function RBACGuard({ allowedRoles, children }: RBACGuardProps) {
    // Ahora el rol viene de la empresa seleccionada, no de la sesión pura
    const { activeRole } = useTenant()

    // Si no hay rol activo o el rol del usuario no está en la lista de permitidos, ocultamos el contenido
    if (!activeRole || !allowedRoles.includes(activeRole)) {
        return null
    }

    // Si tiene el permiso correcto, dibujamos el componente hijo
    return <>{children}</>
}