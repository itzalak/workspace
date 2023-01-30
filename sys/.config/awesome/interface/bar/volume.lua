local awful = require("awful")
local naughty = require("naughty")
local wibox = require("wibox")

local unmute = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

-- Volume
local volume = wibox.widget({
    widget = wibox.widget.textbox,
    font = Font,
    markup = " 󰕾 ",
})

awesome.connect_signal("signal::volume", function(vol, mute)
    vol = tonumber(vol)
    if mute or vol == 0 then
        volume.markup = "<span foreground='" .. Color.red .. "'> 󰖁 </span>"
    else
        volume.markup = "<span foreground='" .. Color.green .. "'> 󰕾 </span>"
    end
end)

volume:connect_signal("button::press", function()
    awful.spawn.easy_async_with_shell(unmute, function()
        naughty.notification({
            urgency = "normal",
            title = "Mute/Unmute!",
        })
    end)
end)

-- TODO: Consider opening pavucontrol with left click

return {
    volume,
    layout = wibox.layout.fixed.horizontal,
}
