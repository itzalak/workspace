local _attributes = {}

function _attributes.pick(cpu_temperature)
    if cpu_temperature > 90 then
        return {
            icon = "<span foreground='" .. Color.red .. "'>󰈸</span>",
            widget_color = Color.red,
        }
    elseif cpu_temperature > 70 then
        return {
            icon = "<span foreground='" .. Color.yellow .. "'>󰔏</span>",
            widget_color = Color.yellow,
        }
    else
        return {
            icon = "<span foreground='" .. Color.fg .. "'>󰔏</span>",
            widget_color = Color.accent,
        }
    end
end

return _attributes