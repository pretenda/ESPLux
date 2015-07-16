return function (connection, args)   
	connection:send("HTTP/1.0 200 OK\r\nContent-Type: application/json\r\nCache-Control: private, no-store\r\n\r\n")
	local m = wifi.getmode()
	wifi.setmode(wifi.STATION) 
	wifi.sta.getap(function(t) if t then for k,v in pairs(t) do 
	l = string.format("%-10s",k) print(l) end else print("No networks found!") end  end)
	wifi.setmode(m)

end