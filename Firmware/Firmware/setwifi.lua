wifi.setmode(wifi.SOFTAP)

cfg={}
cfg.ssid="ESPLux-"..node.chipid()
cfg.pwd="ESPLux-"..node.chipid()
wifi.ap.config(cfg)


cfg = nil

print (wifi.ap.getip())