local beautiful = require "beautiful"
local dpi = beautiful.xresources.apply_dpi
local xrdb = beautiful.xresources.get_current_theme()

function Xdpi(value)
    return dpi(value)
end

function Font(size, type)
    if type == nil then
        type = "Medium"
    end
    return "Iosevka NFM" .. type .. " " .. size
end

Default_Font = Font(14)
Bold_Font = Font(14, "Bold")
Icon_Font = Font(30)

Dimensions = {
    useless_gap = Xdpi(4),
    border = Xdpi(4),
}

Color = {
    bg = xrdb.background,
    fg = xrdb.foreground,
    black = xrdb.color0,
    red = xrdb.color1,
    green = xrdb.color2,
    yellow = xrdb.color3,
    blue = xrdb.color4,
    magenta = xrdb.color5,
    cyan = xrdb.color6,
    white = xrdb.color7,
    gray = xrdb.color8,

    -- Select color accent and transparency for backgrounds
    accent = xrdb.color6,
    transparent = xrdb.background .. "20",
}

-- TODO: Use gears.filesystem.file_readable (filename) to check is wallpaper exists
-- if not, default, or send an error
Wallpaper = os.getenv "HOME" .. "/anvil/wallpapers/wpp07bwSamurai.png"

Terminal = "wezterm"
Editor = "nvim"

Apps = {
    terminal = "wezterm",
    alternative_terminal = "urxvt",
    editor = "nvim",
    launcher = "rofi -theme base -modi drun -show drun",
    browser = "firefox",
    picture = "feh",
    file_manager = "thunar",
    email = "thunderbird",
}

MetaKey = "Mod4"
AltKey = "Mod1"
ControlKey = "Control"
ShiftKey = ShiftKey
