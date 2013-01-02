local awful = require('awful')
local vicious = require('vicious')
-- Create a cpu graph
local cpuwidget = {}

cpuwidget.widget = awful.widget.graph()
-- Graph properties
cpuwidget.widget:set_width(50)
cpuwidget.widget:set_background_color("#494B4F")
cpuwidget.widget:set_color("#FF5656")
cpuwidget.widget:set_stack_colors({ "#FF5656", "#88A175", "#AECF96" })
-- -- Register widget
vicious.register(cpuwidget.widget, vicious.widgets.cpu, "$1")

return cpuwidget
