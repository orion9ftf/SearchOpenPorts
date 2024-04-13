def generar_palabra(length)
  caracteres = [*'a'..'z', *'A'..'Z', *'0'..'9', '$', '%', '-', '.', '&', '#']
  palabra_generada = ''

  length.times { palabra_generada << caracteres.sample }

  palabra_generada
end

palabra_buscada = "Cdfurr$5%-.poruy&#"
intentos = 0

loop do
  intentos += 1
  palabra_generada = generar_palabra(palabra_buscada.length)

  if palabra_generada == palabra_buscada
    puts "Palabra encontrada después de #{intentos} intentos: #{palabra_generada}"
    break
  end
end
