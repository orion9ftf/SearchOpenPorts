def generate_html_with_buttons(file_name, words)
  # Abrir el archivo en modo escritura
  File.open(file_name, "w") do |file| 
    # Escribir el encabezado del HTML con Bootstrap
    file.puts "<!DOCTYPE html>"
    file.puts "<html lang='en'>"
    file.puts "<head>"
    file.puts "  <meta charset='UTF-8'>"
    file.puts "  <meta name='viewport' content='width=device-width, initial-scale=1.0'>"
    file.puts "  <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css'>"
    file.puts "  <title>Botones con Bootstrap</title>"
    file.puts "</head>"
    file.puts "<body>"

    # Crear botones para cada palabra proporcionada
    words.each do |word|
      file.puts "  <button type='button' class='btn btn-primary'>#{word}</button>"
      file.puts "  <br>"
    end

    # Escribir el script para cargar Bootstrap desde CDN
    file.puts "  <script src='https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js'></script>"
    
    # Cerrar el archivo HTML
    file.puts "</body>"
    file.puts "</html>"
  end
end

# Verificar que se proporcionen los argumentos correctos
unless ARGV.length >= 2
  puts "Uso: ruby programa.rb <file_name_html> <palabra1> <palabra2> ..."
  exit
end

# Obtener los argumentos de la línea de comandos (nombre del archivo HTML y words)
file_name_html = ARGV[0] + ".html"
words = ARGV[1..-1]

# Generar el archivo HTML con botones
generate_html_with_buttons(file_name_html, words)

puts "Se ha generado el archivo HTML '#{file_name_html}' con los botones."
