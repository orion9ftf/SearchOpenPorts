# arreglar...
def buscar_palabra(archivo, palabra_buscada)
  encontrado = false

  # Abre el archivo en modo lectura
  File.open(archivo, "r") do |file|
    file.each_line do |linea|
      if linea.include?(palabra_buscada)
        encontrado = true
        break
      end
    end
  end

  encontrado
end

# Verificar que se proporcionen los argumentos correctos
unless ARGV.length == 2
  puts "Uso: ruby programa.rb <archivo> <palabra_buscada>"
  exit
end

# Obtener los argumentos de la línea de comandos
archivo = ARGV[0]
palabra_buscada = ARGV[1]

# Buscar la palabra en el archivo
if buscar_palabra(archivo, palabra_buscada)
  puts "La palabra '#{palabra_buscada}' ha sido encontrada en el archivo."
else
  puts "La palabra '#{palabra_buscada}' no ha sido encontrada en el archivo."
end
