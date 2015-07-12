return function (connection, args) 
	pwm.setduty(1,args.val)

	file.open("PreviousLevel.txt", "w+")
	file.write(args.val)
	file.close()

	connection:send("HTTP/1.0 200 OK\r\nContent-Type: application/json\r\nCache-Control: private, no-store\r\n\r\n")
	connection:send('{ "Message": "Set light value" }')
	print('{ "Message": "Set light value" }')
end