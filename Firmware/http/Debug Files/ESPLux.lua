local function sendHeader(connection)
	connection:send("HTTP/1.0 200 OK\r\nContent-Type: application/json\r\nCache-Control: private, no-store\r\n\r\n")

end

local function sendAttr(connection, attr, val)
   connection:send('"'.. attr .. '": "' .. val .. '",\n')
end

return function (connection, args)
   collectgarbage()
   sendHeader(connection)
   connection:send('{')
   majorVer, minorVer, devVer, chipid, flashid, flashsize, flashmode, flashspeed = node.info();
   sendAttr(connection, "majorVer"              , majorVer)
   sendAttr(connection, "devVer"                , devVer)
   sendAttr(connection, "chipid"                , chipid)
   sendAttr(connection, "flashid"               , flashid)
   sendAttr(connection, "flashsize"             , flashsize)
   sendAttr(connection, "flashmode"             , flashmode)
   sendAttr(connection, "flashspeed"            , flashspeed)
   sendAttr(connection, "node.heap"           , node.heap())
   sendAttr(connection, 'Memory in use'    , collectgarbage("count"))
   sendAttr(connection, 'IP address'            , wifi.sta.getip())
   sendAttr(connection, 'MAC address'           , wifi.sta.getmac())
   connection:send('"ESPLux": "v0.1"')
   connection:send('}')
end