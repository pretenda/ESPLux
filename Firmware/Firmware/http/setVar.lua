return function (connection, args)

	local a = {'PreviousLevel','NumOfRestarts','CurrentLightLevel','DimCapable','LightName','ACOn','ACOnDimLevel'}
	for _,v in pairs(a) do
		if v == args.var then
			foundmatch=1
			break
		end
	end

	connection:send("HTTP/1.0 200 OK\r\nContent-Type: application/json\r\nCache-Control: private, no-store\r\n\r\n")

	if foundmatch == 0 then
		print('{ "Error": "Variable not found" }')
		connection:send('{ "Error": "Variable not found" }')
	else
		file = args.var
		if args.type == "get" then
			file.open(file, "r")
			connection:send('{ "', args.var, '": "', file.read(), '" }')
			print('{ "', args.var, '": "', args.val, '" }')
			file.close()
		elseif args.type == "set" then
			file.open(file, "w+")
			file.write(args.val)
			file.close()
			connection:send('{ "Message": "Set Variable" }')
			print('{ "Message": "Set Variable" }')
		else
			connection:send('{ "Error": "No type set" }')
			print('{ "Error": "No type set" }')
		end
	end
end