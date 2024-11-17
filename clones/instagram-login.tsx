'use client'

import { useState } from 'react'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { FacebookIcon } from 'lucide-react'

export default function Component() {
  const [username, setUsername] = useState('')
  const [password, setPassword] = useState('')

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault()
    console.log('Login attempt:', { username, password })
  }

  return (
    <div className="min-h-screen bg-black flex items-center justify-center p-4">
      <div className="w-full max-w-sm">
        <div className="flex justify-center mb-8">
          <h1 
            className="text-4xl"
            style={{
              fontFamily: "'Brush Script MT', cursive",
              color: "white",
              fontSize: "3rem"
            }}
          >
            Instagram
          </h1>
        </div>
        
        <div className="space-y-4">
          <Input
            type="text"
            placeholder="Teléfono, usuario o correo electrónico"
            value={username}
            onChange={(e) => setUsername(e.target.value)}
            className="w-full px-4 py-3 bg-zinc-800 border-zinc-700 text-white placeholder-zinc-400 rounded-md focus:border-zinc-500 focus:ring-zinc-500"
          />
          <Input
            type="password"
            placeholder="Contraseña"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            className="w-full px-4 py-3 bg-zinc-800 border-zinc-700 text-white placeholder-zinc-400 rounded-md focus:border-zinc-500 focus:ring-zinc-500"
          />
          <Button
            type="submit"
            onClick={handleSubmit}
            className="w-full bg-[#0095F6] hover:bg-[#1877F2] text-white py-2 rounded-md font-semibold transition duration-200"
          >
            Iniciar sesión
          </Button>
        </div>

        <div className="flex items-center my-6">
          <div className="flex-grow border-t border-zinc-800"></div>
          <span className="px-4 text-zinc-400 text-sm font-semibold">o</span>
          <div className="flex-grow border-t border-zinc-800"></div>
        </div>

        <button className="w-full flex items-center justify-center text-[#0095F6] font-semibold mb-4">
          <FacebookIcon className="w-5 h-5 mr-2" />
          Iniciar sesión con Facebook
        </button>

        <a href="#" className="block text-center text-sm text-[#0095F6] mb-4">
          ¿Olvidaste tu contraseña?
        </a>

        <div className="text-center mt-4 border border-zinc-800 rounded-md p-5">
          <p className="text-zinc-400 text-sm">
            ¿No tienes una cuenta?{' '}
            <a href="#" className="text-[#0095F6] font-semibold">
              Regístrate
            </a>
          </p>
        </div>

        <div className="text-center mt-6">
          <p className="text-zinc-400 text-sm mb-4">Descarga la app.</p>
          <div className="flex justify-center space-x-2">
            <a href="#" className="w-36">
              <img
                src="/placeholder.svg?height=40&width=120"
                alt="Descárgalo en el App Store"
                className="h-10"
              />
            </a>
            <a href="#" className="w-36">
              <img
                src="/placeholder.svg?height=40&width=120"
                alt="Disponible en Google Play"
                className="h-10"
              />
            </a>
          </div>
        </div>
      </div>
    </div>
  )
}
