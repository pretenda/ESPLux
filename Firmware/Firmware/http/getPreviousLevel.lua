return function (connection, args)   
	connection:send("HTTP/1.0 200 OK\r\nContent-Type: application/json\r\nCache-Control: private, no-store\r\n\r\n")
	file.open("PreviousLevel.txt", "r")
	connection:send(file.readline())
	file.close()
end