local wibox = require('wibox')
local awful = require('awful')
local vicious = require('vicious')
local wifiwidget = {}
-- 
wifiwidget.widget = wibox.widget.textbox()
wifiwidget.widget:buttons(awful.util.table.join(
  awful.button({ }, 1, function () awful.util.spawn("gksu wpa_gui") end)
))
-- Register Widget
vicious.register(wifiwidget.widget, vicious.widgets.wifi, " wlan: <b>${ssid}</b> ", 5, "wlan0")

return wifiwidget
