-- Begin WiFi configuration
  
	gpio.mode(1,gpio.OUTPUT)
	pwm.setup(1,1000,1023)
	pwm.start(1)
	pwm.setduty(1,0)


print('set (mode='..wifi.getmode()..')')
print('MAC: ',wifi.sta.getmac())
print('chip: ',node.chipid())
print('heap: ',node.heap())

collectgarbage()

-- End WiFi configuration

-- Compile server code and remove original .lua files.
-- This only happens the first time afer the .lua files are uploaded.

local compileAndRemoveIfNeeded = function(f)
   if file.open(f) then
      file.close()
      print('Compiling:', f)
      node.compile(f)
      file.remove(f)
      collectgarbage()
   end
end

local serverFiles = {'httpserver.lua', 'httpserver-request.lua', 'httpserver-static.lua', 'httpserver-header.lua', 'httpserver-error.lua', 'setLightLevel.lua', 'setStartIP.lua', 'resetWireless.lua'}
for i, f in ipairs(serverFiles) do compileAndRemoveIfNeeded(f) end


	dofile("setLightLevel.lc")

	dofile("setStartIP.lc")
	
	dofile("resetWireless.lc")


compileAndRemoveIfNeeded = nil
serverFiles = nil
collectgarbage()

-- Connect to the WiFi access point.
-- Once the device is connected, you may start the HTTP server.

local joinCounter = 0
local joinMaxAttempts = 3
tmr.alarm(0, 3000, 1, function()
   if wifi.getmode() == wifi.SOFTAP then
	print('Running as AP')
	dofile("httpserver.lc")(80)
   else

   local ip = wifi.sta.getip()
   if ip == nil and joinCounter < joinMaxAttempts then
      print('Connecting to WiFi Access Point ...')
      joinCounter = joinCounter +1
   else
      if joinCounter == joinMaxAttempts then
         print('Failed to connect to WiFi Access Point.')
         dofile("httpserver.lc")(80)
      else
         print('IP: ',ip)
         -- Uncomment to automatically start the server in port 80
         dofile("httpserver.lc")(80)
      end
      tmr.stop(0)
      joinCounter = nil
      joinMaxAttempts = nil
      collectgarbage()
end
   end

end)

