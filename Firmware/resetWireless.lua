gpio.mode(7,gpio.INPUT,gpio.FLOAT)
if gpio.read(7) == 1 then
	local wifiConfig = {}
	wifiConfig.accessPointConfig = {}
	wifiConfig.accessPointConfig.ssid = "ESPLux-"..node.chipid()   -- Name of the SSID you want to create
	wifiConfig.accessPointConfig.pwd = "espluxsetup"    -- WiFi password - at least 8 characters
	wifi.setmode(wifi.SOFTAP)
	wifi.ap.config(wifiConfig.accessPointConfig)
	wifiConfig = nil
	gpio.mode(2, gpio.OUTPUT)
	gpio.write(2, gpio.HIGH)
	print("ESPLux: Reset Wifi")
	

local joinCounter = 0
local joinMaxAttempts = 2
tmr.alarm(0, 3000, 1, function()
   if joinCounter < joinMaxAttempts then
      print('Restarting soon .. ')
      joinCounter = joinCounter +1
   else
	node.restart()
   end
end)




else
	print("ESPLux: No wifi reset needed")
end
