import { useNavigate } from 'react-router-dom'
import { useQueryClient } from '@tanstack/react-query'
import { supabase } from '@/services/supabase/client'

export function useLogout() {
    const navigate = useNavigate()
    const queryClient = useQueryClient()

    const logout = async () => {
        try {
            // 1. Cancelar cualquier petición HTTP que esté en vuelo
            await queryClient.cancelQueries()

            // 2. Destruir la sesión en Supabase
            const { error } = await supabase.auth.signOut()
            if (error) throw error

            // 3. Limpiar toda la caché de React Query
            queryClient.clear()

            // 4. Limpiar cualquier almacenamiento local (Capacitor/Web)
            localStorage.clear()
            sessionStorage.clear()

            // 5. Expulsar al usuario
            navigate('/login', { replace: true })
        } catch (error) {
            console.error('Error durante el cierre de sesión seguro:', error)
            // Como medida de emergencia, forzamos la salida visual aunque falle el backend
            navigate('/login', { replace: true })
        }
    }

    return { logout }
}