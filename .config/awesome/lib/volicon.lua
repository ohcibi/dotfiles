local awful = require('awful')
local wibox = require('wibox')
local volicon = {}
--Create a Volume Widget
volicon.icon = wibox.widget.imagebox()
volicon.icon:set_image(awful.util.getdir('config') .. "/images/volicon.png")

return volicon
