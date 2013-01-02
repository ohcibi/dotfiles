local awful = require('awful')
local vicious = require('vicious')
local volbar = {}
-- --Initialize widget
volbar.widget = awful.widget.progressbar()
-- --Progressbar settings
volbar.widget:set_width(8)
volbar.widget:set_vertical(true)
volbar.widget:set_ticks(true)
volbar.widget:set_ticks_gap(1)
volbar.widget:set_ticks_size(2)
volbar.widget:set_background_color("#000000")
volbar.widget:set_border_color("#000000")
volbar.widget:set_color("#D9D9D9")
-- --Register widget
vicious.register(volbar.widget, vicious.widgets.volume, function (widget, args)
  return args[1]
end, 1, "Master")

return volbar
