import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import tailwindcss from '@tailwindcss/vite'

// https://vite.dev/config/
export default defineConfig({
  plugins: [
    react(),
    tailwindcss(),
  ],
  server: {
    proxy: {
      "/backend": {
        target: "http://localhost:1337",
        changeOrigin: true,
        secure: false,
        rewrite: (path) => path.replace(/^\/backend/, '')
      },
    },
  },
})
