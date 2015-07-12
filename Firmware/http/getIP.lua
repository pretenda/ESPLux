return function (connection, args)   
	connection:send("HTTP/1.0 200 OK\r\nContent-Type: application/json\r\nCache-Control: private, no-store\r\n\r\n")
    ip, nm, gw = wifi.sta.getip()


	connection:send(ip)
	connection:send("\n")
	connection:send(nm)
	connection:send("\n")
	connection:send(gw)
end