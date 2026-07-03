"use client"

import { useState } from "react"
import { Outlet } from "react-router-dom"
import { Sidebar } from "./Sidebar"
import Header from "./Header"

export function AppLayout() {
    const [sidebarOpen, setSidebarOpen] = useState(false)
    const [isCollapsed, setIsCollapsed] = useState(false)

    return (
        // 1. h-[100dvh] asegura que la app se ciña a lo que TÚ puedes ver (Visual Viewport)
        <div className="flex h-[100dvh] w-full bg-slate-50/50 overflow-hidden font-sans">

            <Sidebar
                isOpen={sidebarOpen}
                onClose={() => setSidebarOpen(false)}
                isCollapsed={isCollapsed}
                setIsCollapsed={setIsCollapsed}
            />

            {/* 2. LA MAGIA DEL SAFE AREA:
                Aplicamos el 'paddingBottom: env(...)' al CONTENEDOR PADRE de la página.
                Esto levanta físicamente el "piso" de la aplicación. Cualquier botón 
                'sticky bottom-0' que tengas en tus formularios o tablas, se pegará a este
                nuevo piso seguro, quedando por encima de la barra nativa de gestos del celular.
            */}
            <div
                className="flex-1 flex flex-col overflow-hidden min-w-0 min-h-0 relative"
                style={{ paddingBottom: 'env(safe-area-inset-bottom, 0px)' }}
            >

                <Header onMenuToggle={() => setSidebarOpen(!sidebarOpen)} />

                {/* 3. El contenedor con Scroll purificado (Fase 1) */}
                <main className="flex-1 min-h-0 overflow-y-auto overflow-x-hidden relative bg-slate-50/50">

                    {/* Quitamos los padding-bottom gigantes (pb-36) porque el contenedor 
                        padre ya está manejando el espacio de seguridad. Dejamos márgenes naturales. */}
                    <div className="p-4 pb-8 sm:p-6 lg:p-8 max-w-[1400px] mx-auto w-full animate-fade-in">
                        <Outlet />
                    </div>

                </main>

            </div>
        </div>
    )
}