# revisar...
def verify_password(user, password_entered, password_file)
  password = File.readlines(password_file).map(&:chomp)

  if password.include?(password_entered)
    puts "¡Contraseña correcta para el usuario '#{user}'!"
  else
    puts "Contraseña incorrecta para el usuario '#{user}'. Intenta de nuevo."
  end
end

# Verificar que se proporcionen los argumentos correctos
unless ARGV.length == 2
  puts "Uso: ruby programa.rb <nombre_de_usuario> <password_file>"
  exit
end

# Obtener los argumentos de la línea de comandos
user = ARGV[0]
password_file = ARGV[1]

puts "Ingrese la contraseña para el usuario '#{user}':"
password_entered = gets.chomp

verify_password(user, password_entered, password_file)
