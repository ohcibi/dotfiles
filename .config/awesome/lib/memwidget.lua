local awful = require('awful')
local vicious = require('vicious')
-- -- Initialize memwidget
local memwidget = {}
memwidget.widget = awful.widget.progressbar()
-- -- Progressbar properties
memwidget.widget:set_width(20)
memwidget.widget:set_vertical(true)
memwidget.widget:set_background_color("#494B4F")
memwidget.widget:set_border_color(nil)
memwidget.widget:set_color("#AECF96")
-- -- Register widget
vicious.register(memwidget.widget, vicious.widgets.mem, "$1", 13)

return memwidget
