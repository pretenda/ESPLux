-- init mqtt client with keepalive timer 120sec
m = mqtt.Client("clientid", 120, "me@mattfanning.com", "ad090264")

-- setup Last Will and Testament (optional)
-- Broker will publish a message with:
-- qos = 0, retain = 0, data = "offline" 
-- to topic "/lwt" if client don't send keepalive packet

m:on("connect", function(con) print ("connected") end)
m:on("offline", function(con) print ("offline") end)

-- on publish message receive event
m:on("message", function(conn, topic, data) 
  print(topic .. ":" ) 
  if data ~= nil then
    pwm.setduty(1,data)
  end

end)

-- for secure: m:connect("192.168.11.118", 1880, 1)
m:connect("162.222.176.239", 1883, 0, function(conn) 
    print("connected") 

    m:subscribe("/me@mattfanning.com/ESPLux",0, function(conn) 
    print("subscribe success") 
end)
end)

-- subscribe topic with qos = 0

