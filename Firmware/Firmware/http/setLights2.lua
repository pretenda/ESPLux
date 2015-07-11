return function (connection, args)   
	gpio.mode(1,gpio.OUTPUT)
	pwm.setup(1,1000,1023)
	pwm.start(1)
	pwm.setduty(1,args.val)
	print(args.val)
	file.open("PreviousLevel.txt", "w+")
	file.write(args.val)
	file.close()

	connection:send("HTTP/1.0 200 OK\r\nContent-Type: application/json\r\nCache-Control: private, no-store\r\n\r\n")
	connection:send('{ "Message": "Set light value" }')
	print('{ "Message": "Set light value" }')
end