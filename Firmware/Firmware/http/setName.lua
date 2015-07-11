return function (connection, args)   
	connection:send("HTTP/1.0 200 OK\r\nContent-Type: application/json\r\nCache-Control: private, no-store\r\n\r\n")
	file.open("LightName.txt", "w+")
	file.writeline(args.val)
connection:send(args.val)
	file.close()
end