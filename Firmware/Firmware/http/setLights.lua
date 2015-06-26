return function (connection, args) 
	pwm.setduty(1,args.val)

	connection:send("HTTP/1.0 200 OK\r\nContent-Type: application/json\r\nCache-Control: private, no-store\r\n\r\n")
	connection:send('{ "Message": "Set light value" }')
	print('{ "Message": "Set light value" }')
end