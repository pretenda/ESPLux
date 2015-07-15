local ACOn = 0
file.open("Net.txt", "r")
if file.readline() == "1" then
		wifi.sta.setip({ip=file.readline(), netmask=file.readline(), gateway=file.readline()})
	end


end
