morse_dict = {
  'A' => '.-', 'B' => '-...', 'C' => '-.-.', 'D' => '-..', 'E' => '.', 'F' => '..-.', 'G' => '--.', 'H' => '....',
  'I' => '..', 'J' => '.---', 'K' => '-.-', 'L' => '.-..', 'M' => '--', 'N' => '-.', 'O' => '---', 'P' => '.--.',
  'Q' => '--.-', 'R' => '.-.', 'S' => '...', 'T' => '-', 'U' => '..-', 'V' => '...-', 'W' => '.--', 'X' => '-..-',
  'Y' => '-.--', 'Z' => '--..',
  '0' => '-----', '1' => '.----', '2' => '..---', '3' => '...--', '4' => '....-', '5' => '.....', '6' => '-....',
  '7' => '--...', '8' => '---..', '9' => '----.'
}

# Función para convertir una frase a código Morse
def text_to_morse(text, morse_dict)
  morse = ''
  text.upcase.each_char do |char|
    if char == ' '
      morse += ' '
    elsif morse_dict.key?(char)
      morse += morse_dict[char] + ' '
    else
      morse += char
    end
  end
  morse.strip
end

# Solicitar al usuario que ingrese una frase
puts 'Ingresa una frase para convertir a código Morse:'
input_text = gets.chomp

# Convertir la frase ingresada a código Morse
morse_code = text_to_morse(input_text, morse_dict)

# Mostrar el resultado
puts "El código Morse correspondiente es: #{morse_code}"
