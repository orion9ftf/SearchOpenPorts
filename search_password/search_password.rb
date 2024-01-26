def verify_password(password_entered, password_file)
  password = File.readlines(password_file).map(&:chomp)

  if password.include?(password_entered)
    puts "¡Contraseña correcta!"
  else
    puts "Contraseña incorrecta. Intenta de nuevo :("
  end
end

# Nombre del archivo que contiene las contraseñas
password_file = "password.txt"

puts "Ingrese la contraseña:"
password_entered = gets.chomp

verify_password(password_entered, password_file)

