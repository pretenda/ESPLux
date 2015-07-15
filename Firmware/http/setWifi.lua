return function (connection, args)   
	connection:send("HTTP/1.0 200 OK\r\nContent-Type: application/json\r\nCache-Control: private, no-store\r\n\r\n")
	file.open("Net.txt", "w+")
	file.writeline(args.static)
	file.writeline(args.ip)
	file.writeline(args.nm)
	file.writeline(args.gw)
	file.close()
	wifi.setmode(wifi.STATION)
	wifi.sta.config(args.s,args.p)
	if args.static == "1" then
		wifi.sta.setip({ip=args.ip, netmask=args.nm, gateway=args.gw})
	end
end