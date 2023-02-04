local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")

local volume = require("helpers.volume")
local brightness = require("helpers.brightness")

modkey = "Mod4"
alt = "Mod1"

-- App keybinding
awful.keyboard.append_global_keybindings({
	-- Apps

	awful.key({ modkey }, "Return", function()
		awful.spawn(Apps.terminal)
	end, { description = "open alacritty", group = "launcher" }),

	awful.key({ alt }, "Return", function()
		awful.spawn(Apps.alternative_terminal)
	end, { description = "open urxvt", group = "launcher" }),

	awful.key({ alt }, "c", function()
		awful.spawn(Apps.browser)
	end, { description = "open firefox", group = "launcher" }),

	awful.key({ alt }, "f", function()
		awful.spawn(Apps.file_manager)
	end, { description = "open nautilus", group = "launcher" }),

	awful.key({ alt }, "e", function()
		awful.spawn(Apps.email)
	end, { description = "open thunderbird", group = "launcher" }),

	-- Menus

	-- Todo: spawns and closes immediately
	awful.key({ modkey }, "space", function()
		awful.spawn(Apps.launcher, false)
	end, { description = "open app menu", group = "Menus" }),

	awful.key({ alt }, "t", function()
		awful.titlebar.toggle(client.focus)
	end, { description = "toggle titlebar", group = "Menus" }),

	awful.key({ alt }, "s", function()
		awesome.emit_signal("sidebar::toggle")
	end, { description = "toggle sidebar", group = "Menus" }),

	-- Volume

	awful.key({}, "XF86AudioMute", function()
		volume.toggle_volume()
	end, { description = "Mute/Unmute (F1)", group = "Volume" }),

	awful.key({}, "XF86AudioLowerVolume", function()
		volume.decrease()
	end, { description = "Decrease Volume (F2)", group = "Volume" }),

	awful.key({}, "XF86AudioRaiseVolume", function()
		volume.increase()
	end, { description = "Increase Volume (F3)", group = "Volume" }),

	-- Brightness

	awful.key({}, "XF86MonBrightnessDown", function()
		brightness.decrease()
	end, { description = "Decrease brightness (F5)", group = "Volume" }),

	awful.key({}, "XF86MonBrightnessUp", function()
		brightness.increase()
	end, { description = "Increase brightness (F6)", group = "Volume" }),

	-- Others

	awful.key({ alt }, "i", function()
		hotkeys_popup.show_help(nil, awful.screen.focused())
	end, { description = "show help", group = "Others" }),

})