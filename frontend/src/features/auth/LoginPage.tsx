import { useState, useEffect } from 'react'
import { useNavigate, useLocation } from 'react-router-dom'
import { Sparkles, Loader2 } from 'lucide-react'

// Usamos únicamente tus componentes existentes
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import {
    Card,
    CardContent,
    CardDescription,
    CardFooter,
    CardHeader,
    CardTitle
} from '@/components/ui/card'

import { supabase } from '@/services/supabase/client'
import { useAuth } from '@/core/auth/useAuth'

export function LoginPage() {
    const { user } = useAuth()
    const navigate = useNavigate()
    const location = useLocation()

    // Estados para capturar lo que el usuario escribe (Tu lógica original)
    const [email, setEmail] = useState('')
    const [password, setPassword] = useState('')
    const [isLoading, setIsLoading] = useState(false)
    const [errorMsg, setErrorMsg] = useState('')

    // Si el usuario intentaba ir a una ruta protegida, la recordamos. Si no, va al dashboard.
    const from = location.state?.from?.pathname || '/dashboard'

    // REDIRECCIÓN REACTIVA: Si el AuthProvider confirma que ya hay sesión, nos saca de aquí
    useEffect(() => {
        if (user) {
            navigate(from, { replace: true })
        }
    }, [user, navigate, from])

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault()
        setIsLoading(true)
        setErrorMsg('')

        // Llamada real de autenticación a Supabase
        const { error } = await supabase.auth.signInWithPassword({
            email,
            password,
        })

        if (error) {
            console.error("Error de login:", error.message)
            setErrorMsg('Credenciales inválidas. Por favor, intenta de nuevo.')
            setIsLoading(false)
        }
        // Nota: Ya no hacemos navigate('/dashboard') aquí de forma manual.
        // El useEffect de arriba se encargará automáticamente en cuanto Supabase active la sesión.
    }

    return (
        <div className="flex min-h-screen items-center justify-center bg-zinc-50 p-4 font-sans">
            <Card className="w-full max-w-md shadow-sm">
                <CardHeader className="space-y-2 text-center">
                    <div className="mx-auto flex h-12 w-12 items-center justify-center rounded-xl bg-zinc-900 text-white mb-4 shadow-md">
                        <Sparkles className="h-6 w-6" />
                    </div>
                    <CardTitle className="text-2xl font-bold tracking-tight">Bienvenido de nuevo</CardTitle>
                    <CardDescription className="text-zinc-500">
                        Ingresa a tu cuenta para continuar al cotizador
                    </CardDescription>
                </CardHeader>

                <CardContent>
                    <form onSubmit={handleSubmit} className="space-y-4">

                        {/* Mensaje de Error Dinámico */}
                        {errorMsg && (
                            <div className="p-3 text-sm font-medium text-red-500 bg-red-50 rounded-md border border-red-200">
                                {errorMsg}
                            </div>
                        )}

                        <div className="space-y-2">
                            <label htmlFor="email" className="text-sm font-medium text-zinc-900">
                                Correo electrónico
                            </label>
                            <Input
                                id="email"
                                type="email"
                                placeholder="nombre@empresa.com"
                                required
                                className="h-11"
                                value={email}
                                disabled={isLoading}
                                onChange={(e) => setEmail(e.target.value)}
                            />
                        </div>

                        <div className="space-y-2">
                            <div className="flex items-center justify-between">
                                <label htmlFor="password" className="text-sm font-medium text-zinc-900">
                                    Contraseña
                                </label>
                                <a href="#" className="text-sm font-medium text-zinc-600 hover:text-zinc-900 hover:underline">
                                    ¿Olvidaste tu contraseña?
                                </a>
                            </div>
                            <Input
                                id="password"
                                type="password"
                                required
                                className="h-11"
                                value={password}
                                disabled={isLoading}
                                onChange={(e) => setPassword(e.target.value)}
                            />
                        </div>

                        <Button
                            type="submit"
                            className="w-full h-11 text-base text-white bg-zinc-900 hover:bg-zinc-800 transition-colors"
                            disabled={isLoading}
                        >
                            {isLoading ? (
                                <><Loader2 className="mr-2 h-4 w-4 text-white animate-spin" /> Iniciando sesión...</>
                            ) : (
                                'Iniciar sesión'
                            )}
                        </Button>
                    </form>
                </CardContent>

                <CardFooter className="flex justify-center border-t p-4 mt-4">
                    <p className="text-sm text-zinc-500">
                        ¿No tienes una cuenta? <a href="#" className="font-medium text-zinc-900 hover:underline">Contacta a soporte</a>
                    </p>
                </CardFooter>
            </Card>
        </div>
    )
}