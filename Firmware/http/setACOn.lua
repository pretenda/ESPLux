return function (connection, args)   
	connection:send("HTTP/1.0 200 OK\r\nContent-Type: application/json\r\nCache-Control: private, no-store\r\n\r\n")
	file.open("ACOn.txt", "w+")
	if args.val == "1" then file.write("1")
	elseif args.val == "0" then file.write("0")
else
	connection:send("nfi: ")
end
connection:send(args.val)
	file.close()
end