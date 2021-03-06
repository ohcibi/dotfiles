local string = string
local os = os
local math = math
local mouse = mouse
local awful = require("awful")
local beautiful = require("beautiful")
local naughty = require("naughty")
local markup = require("markup")
module("calendar")

local calendar = nil
local offset = 0

function remove()
  if calendar ~= nil then
    naughty.destroy(calendar)
    calendar = nil
    offset = 0
  end
end

function add(inc_offset)
  local save_offset = offset
  remove()
  offset = save_offset + (inc_offset or 0)
  local datespec = os.date("*t")
  datespec = datespec.year * 12 + datespec.month - 1 + offset
  datespec = (datespec % 12 + 1) .. " " .. math.floor(datespec / 12)
  local cal = awful.util.pread("cal -m " .. datespec)
  cal = string.gsub(cal, "^%s*(.-)%s*$", "%1")
  calendar = naughty.notify({
    title = os.date("%a, %d %B %Y"),
    text = markup.font("monospace", cal),
    --text = datespec,
    timeout = 0})
end

-- vim:set filetype=lua fdm=marker tabstop=4 shiftwidth=4 expandtab smarttab autoindent smartindent: --
