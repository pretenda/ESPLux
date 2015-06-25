-- a simple http server

srv=net.createServer(net.TCP) 
srv:listen(80,function(conn) 
    local rnrn=0
    local Status = 0
    local DataToGet = 0
    local method=""
    local url=""
    local vars=""
    conn:on("receive",function(conn,payload) 

    if Status==0 then
        _, _, method, url, vars = string.find(payload, "([A-Z]+) /([^?]*)%??(.*) HTTP")
        -- print(method, url, vars)                          
    end
    
    -- some ugly magic for Apple IOS Devices
    if string.find(url, "/") ~= nil then
     --print ("Slash found")
        local invurl=string.reverse(url)
        local a,b=string.find(invurl, "/", 1)
        url=string.sub(url, string.len(url)-(a-2))
     --print ("Neue URL= " .. url)
    end
    
    if string.len(url)>= 25 then
        url = string.sub (url,1,25)
    --  print ("cut down URL")
    end

    print(url)


    if url==nil then
        url="index.html"
    end
    
    if url=="" then
        url="index.html"
    end

    local foundmatch = 0
    local a = {'index.html','settings.html','support.html','jquery.min.js','esplux.js','side-menu.css','ui.js'}
    for _,v in pairs(a) do
        if v == url then
            foundmatch=1
            print ("Found " .. v)
            break
        end
    end

    
    if foundmatch == 0 then
        -- print ("Found no match, setting index")
        url="index.html"
    end

    
    print(payload) 
        conn:send("HTTP/1.1 200 OK\r\nServer: ESPLux\r\nContent-Type: text/html\r\n")

        DataToGet = 0

    
    end)


    conn:on("sent",function(conn) 
    if DataToGet>=0 and method=="GET" then
        if file.open(url, "r") then            
            file.seek("set", DataToGet)
            local line=file.read(512)
            file.close()
            if line then
                conn:send(line)
                DataToGet = DataToGet + 512    

                if (string.len(line)==512) then
                    return
                end
            end
        end        
    end

    conn:close() 
  end)

  
end)


print("Starting Server")
