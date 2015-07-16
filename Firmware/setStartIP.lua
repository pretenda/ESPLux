local staticIP = 0
file.open("Net.txt", "r")
staticIP = file.readline()
local ipA = file.readline()
local nm = file.readline()
local gw = file.readline()

file.close()
if staticIP == "1\n" then
	wifi.sta.setip({ip=ipA, netmask=nm, gateway=gw})
	print("ESPLux: Static IP Set!")
else
	print("ESPLux: Using DHCP")
end
