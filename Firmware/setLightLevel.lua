local ACOn = 0
file.open("ACOn.txt", "r")
ACOn = file.readline()
file.close()
print(ACOn)
if ACOn == "1" then -- If AC set to 1, reset to previous level
	file.open("PreviousLevel.txt", "r")
	pwm.setduty(1,file.readline())
	file.close()
else -- set light full on
	pwm.setduty(1,1023)
end
