return function (connection, args)  
	pin=2
	connection:send("HTTP/1.0 200 OK\r\nContent-Type: application/json\r\nCache-Control: private, no-store\r\n\r\n")

	if args.state == "on" then
		connection:send('{ "Message": "Indicator On" }')
		print('{ "Message": "Indicator On" }')
		gpio.mode(pin, gpio.OUTPUT)
		gpio.write(pin, gpio.HIGH)
	else
		connection:send('{ "Message": "Indicator Off" }')
		print('{ "Message": "Indicator Off" }')
		gpio.mode(pin, gpio.OUTPUT)
		gpio.write(pin, gpio.LOW)
	end
end