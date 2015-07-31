gpio.mode(7,gpio.INPUT,gpio.FLOAT)
if gpio.read(7) == 1 then
	
	file.open("Net.txt", "w+")
	file.writeline("0")
	file.writeline("192.168.1.200")
	file.writeline("255.255.255.0")
	file.writeline("192.168.1.1")
	file.close()

	file.open("Seed.txt", "r")
	local seed = file.readline()
	math.randomseed(seed)
	print(seed)
	file.close()

	file.open("Seed.txt", "a")
	file.write('1')
	file.close()

	local wifiConfig = {}
	wifiConfig.accessPointConfig = {}
	wifiConfig.accessPointConfig.ssid = "ESPLux-"..math.random(100,999)   -- Name of the SSID you want to create
	wifiConfig.accessPointConfig.pwd = "espluxsetup"    -- WiFi password - at least 8 characters
	wifi.setmode(wifi.SOFTAP)
	wifi.ap.config(wifiConfig.accessPointConfig)
	print("ESPLux: Wifi reset to:" .. wifiConfig.accessPointConfig.ssid)
	wifiConfig = nil
	gpio.mode(2, gpio.OUTPUT)
	gpio.write(2, gpio.HIGH)
else
	print("ESPLux: No wifi reset needed")
end
