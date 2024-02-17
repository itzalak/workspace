local wezterm = require "wezterm"

return {
    font = wezterm.font_with_fallback {
        { family = "IosevkaTerm Nerd Font Mono", weight = "Medium" },
        "Fira Code",
        "Material Design Icons",
    },
    warn_about_missing_glyphs = true,
    font_size = 13,

    -- Padding
    window_padding = {
        left = 20,
        right = 20,
        top = 20,
        bottom = 20,
    },

    -- Tab Bar
    enable_tab_bar = true,
    hide_tab_bar_if_only_one_tab = true,
    show_tab_index_in_tab_bar = true,

    -- General
    automatically_reload_config = true,
    window_background_opacity = 0.95,
    window_close_confirmation = "NeverPrompt",

    -- Coloscheme
    -- color_scheme = "Bright (base16)",
    color_scheme_dirs = {
        os.getenv "HOME" .. "/.config/decorator/output",
    },
    color_scheme = "Wezterm",

    -- Pretty Colors
    bold_brightens_ansi_colors = true,

    -- Keybinds
    keys = {
        {
            key = [[\]],
            mods = "CTRL|ALT",
            action = wezterm.action {
                SplitHorizontal = { domain = "CurrentPaneDomain" },
            },
        },
        {
            key = [[\]],
            mods = "CTRL",
            action = wezterm.action {
                SplitVertical = { domain = "CurrentPaneDomain" },
            },
        },
        {
            key = "q",
            mods = "CTRL",
            action = wezterm.action { CloseCurrentPane = { confirm = false } },
        },
        {
            key = "h",
            mods = "CTRL",
            action = wezterm.action { ActivatePaneDirection = "Prev" },
        },
        {
            key = "l",
            mods = "CTRL",
            action = wezterm.action { ActivatePaneDirection = "Prev" },
        },
        {
            key = "k",
            mods = "CTRL",
            action = wezterm.action { ActivatePaneDirection = "Next" },
        },
        {
            key = "j",
            mods = "CTRL",
            action = wezterm.action { ActivatePaneDirection = "Next" },
        },
    },
}
