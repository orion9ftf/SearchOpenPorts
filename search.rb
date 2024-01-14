require 'socket'

def escanner_ports(ip, ports)
  ports.each do |port|
    begin
      socket = TCPSocket.new(ip, port)
      puts "port #{port} abierto"
      socket.close
    rescue Errno::ECONNREFUSED, Errno::ETIMEDOUT
      # Ignorar errores de conexión rechazada o tiempo de espera agotado
    end
  end
end

if ARGV.length < 1
  puts "Uso: ruby escaner_ports.rb <IP o dominio> [ports]"
  exit
end

ip_or_domain = ARGV[0]
ports = ARGV[1..-1].map(&:to_i)

if ports.empty?
  # Escanear los primeros 1024 ports si no se proporciona una lista específica
  ports = (1..1024).to_a
end

escanner_ports(ip_or_domain, ports)

