local wibox = require('wibox')
local vicious = require('vicious')
local netwidget = {}
-- net widget
netwidget.widget = wibox.widget.textbox()
-- Register Widget
vicious.register(netwidget.widget, vicious.widgets.net, "<b>${wlan0 down_kb}</b> kB/s ", 2)

return netwidget
