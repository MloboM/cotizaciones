/** @type {import('tailwindcss').Config} */
export default {
    content: [
        "./index.html",
        "./src/**/*.{js,ts,jsx,tsx}",
    ],
    theme: {
        extend: {
            // AQUÍ INYECTAMOS LAS FUENTES ESTILO SUPABASE
            fontFamily: {
                sans: ['"Plus Jakarta Sans"', 'sans-serif'],
                mono: ['"JetBrains Mono"', 'monospace'],
            },
        },
    },
    plugins: [],
}