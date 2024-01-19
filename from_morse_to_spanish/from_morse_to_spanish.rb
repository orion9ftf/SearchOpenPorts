# Definición del diccionario para traducir código Morse a letras y números
morse_dict = {
  '.-' => 'A', '-...' => 'B', '-.-.' => 'C', '-..' => 'D', '.' => 'E', '..-.' => 'F', '--.' => 'G', '....' => 'H',
  '..' => 'I', '.---' => 'J', '-.-' => 'K', '.-..' => 'L', '--' => 'M', '-.' => 'N', '---' => 'O', '.--.' => 'P',
  '--.-' => 'Q', '.-.' => 'R', '...' => 'S', '-' => 'T', '..-' => 'U', '...-' => 'V', '.--' => 'W', '-..-' => 'X',
  '-.--' => 'Y', '--..' => 'Z',
  '-----' => '0', '.----' => '1', '..---' => '2', '...--' => '3', '....-' => '4', '.....' => '5', '-....' => '6',
  '--...' => '7', '---..' => '8', '----.' => '9'
}

# Función para convertir código Morse a texto
def morse_to_text(morse_code, morse_dict)
  text = ''
  morse_words = morse_code.split('   ') # Separar palabras
  morse_words.each do |word|
    morse_chars = word.split(' ') # Separar caracteres
    morse_chars.each do |char|
      if morse_dict.key?(char)
        text += morse_dict[char]
      else
        text += char
      end
    end
    text += ' ' # Agregar espacio entre palabras
  end
  text.strip
end

# Solicitar al usuario que ingrese código Morse
puts 'Ingresa el código Morse a decodificar:'
input_morse = gets.chomp

# Convertir el código Morse ingresado a texto
decoded_text = morse_to_text(input_morse, morse_dict)

# Mostrar el resultado
puts "El código Morse corresponde a: #{decoded_text}".downcase
