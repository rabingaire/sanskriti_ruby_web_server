require 'socket'
require 'date'

host = 'localhost'
port = 8080

server = TCPServer.new(host, port)
date_time = DateTime.now

STDERR.puts "WebServer SansKriti 1.0\r\n" +
     "Author: Rabin Gaire\r\n" +
     "Host: #{host}\r\n" +
     "Port: #{port}"

loop do
  socket = server.accept
  request = socket.gets

  begin
    response = "Hello World!\n" +
               "Date/Time: #{date_time.strftime('%d/%m/%Y %H:%M')}"


    socket.print "HTTP/1.1 200 OK\r\n" +
                 "Content-Type: text/html\r\n" +
                 "Content-Length: #{response.bytesize}\r\n" +
                 "Connection: close\r\n"
    socket.print "\r\n"
    STDERR.puts "Status 200 Ok Date/Time: #{date_time.strftime('%d/%m/%Y %H:%M')}"
    socket.print response
  rescue Errno::EPIPE
    STDERR.puts "Connection broke!"
  end
  socket.close
end 


