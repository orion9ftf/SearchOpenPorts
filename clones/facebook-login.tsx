import { useState } from "react"
import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Card, CardContent, CardFooter, CardHeader } from "@/components/ui/card"
import { Separator } from "@/components/ui/separator"

export default function FacebookLogin() {
  const [email, setEmail] = useState("")
  const [password, setPassword] = useState("")

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault()
    console.log("Login attempt with:", { email, password })
    // Aquí iría la lógica de autenticación real
  }

  return (
    <div className="min-h-screen bg-gray-100 flex flex-col items-center justify-center p-4">
      <Card className="w-full max-w-md">
        <CardHeader>
          <h1 className="text-3xl font-bold text-center text-blue-600">facebook</h1>
        </CardHeader>
        <CardContent>
          <form onSubmit={handleSubmit} className="space-y-4">
            <div className="space-y-2">
              <Label htmlFor="email" className="sr-only">
                Correo electrónico o número de teléfono
              </Label>
              <Input
                id="email"
                placeholder="Correo electrónico o número de teléfono"
                type="text"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                required
              />
            </div>
            <div className="space-y-2">
              <Label htmlFor="password" className="sr-only">
                Contraseña
              </Label>
              <Input
                id="password"
                placeholder="Contraseña"
                type="password"
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                required
              />
            </div>
            <Button type="submit" className="w-full bg-blue-600 hover:bg-blue-700">
              Iniciar sesión
            </Button>
          </form>
          <div className="mt-4 text-center">
            <a href="#" className="text-blue-600 hover:underline text-sm">
              ¿Olvidaste tu contraseña?
            </a>
          </div>
          <Separator className="my-4" />
          <div className="text-center">
            <Button variant="secondary" className="bg-green-500 hover:bg-green-600 text-white">
              Crear cuenta nueva
            </Button>
          </div>
        </CardContent>
        <CardFooter className="text-center text-sm text-gray-600">
          <p>
            <a href="#" className="font-bold hover:underline">
              Crear una página
            </a>{" "}
            para una celebridad, una marca o un negocio.
          </p>
        </CardFooter>
      </Card>
      <footer className="mt-8 text-center text-xs text-gray-500 space-y-2">
        <div className="space-x-2">
          <a href="#" className="hover:underline">
            Español
          </a>
          <a href="#" className="hover:underline">
            English (US)
          </a>
          <a href="#" className="hover:underline">
            Français (France)
          </a>
          <a href="#" className="hover:underline">
            Português (Brasil)
          </a>
        </div>
        <div className="space-x-2">
          <a href="#" className="hover:underline">
            Registrarte
          </a>
          <a href="#" className="hover:underline">
            Iniciar sesión
          </a>
          <a href="#" className="hover:underline">
            Messenger
          </a>
          <a href="#" className="hover:underline">
            Facebook Lite
          </a>
        </div>
        <div>
          <p>Meta © 2023</p>
        </div>
      </footer>
    </div>
  )
}