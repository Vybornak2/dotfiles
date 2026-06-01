-- =============================================================================
-- Modern Hyprland Lua Configuration
-- Minimal, Reproducible, Keyboard-Centric Build
-- =============================================================================

----------------------------------  DEFAULTS  ----------------------------------
local terminal    = "foot"
local menu        = "wofi --show drun --allow-images"

---------------------------------- AUTOSTART  ----------------------------------
hl.on("hyprland.start", function () 
    hl.exec_cmd("waybar")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("mako")
end)

---------------------------- ENVIRONMENT VARIABLES  ----------------------------
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")

----------------------------------  MONITORS  ----------------------------------
-- Left Portrait Monitor (1080x1920 rotated, sitting at 0x0)
hl.monitor({
    output    = "DP-2",
    mode      = "1920x1080@60",
    position  = "0x0",
    scale     = "1",
    transform = 1,
})

-- Center Main Widescreen (2560x1440@144Hz, sitting right after left monitor)
hl.monitor({
    output    = "DP-3",
    mode      = "2560x1440@144",
    position  = "1080x0",
    scale     = "1",
})

-- Right Portrait Monitor (1080x1920 rotated, sitting after center monitor)
hl.monitor({
    output    = "DP-1",
    mode      = "1920x1080@60",
    position  = "3640x0",
    scale     = "1",
    transform = 3,
})

---------------------------------- VISUALS  ------------------------------------
hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 10,  -- Slightly tightened for better screen space
        border_size = 2,
        col = {
            -- Static vibrant teal/green gradient for focused windows
            active_border   = { colors = {"rgba(33ccffee)", "rgba(00ff99ee)"}, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },
        layout = "dwindle",
    },
    decoration = {
        rounding = 8,
        shadow = { enabled = false }, -- Disabled shadows for absolute minimal latency
        blur = {
            enabled = true,
            size    = 3,
            passes  = 1,
        },
    },
    animations = {
        enabled = true, -- Smooth but snap-fast animations
    },
    misc = {
        force_default_wallpaper = 0, -- Strip out default branding images
        disable_hyprland_logo   = true,
    }
})

------------------------------------ INPUT  ------------------------------------
hl.config({
    input = {
        kb_layout    = "us",
        follow_mouse = 1,
        sensitivity  = 0,
        touchpad = {
            natural_scroll = true, -- Cleaner feel for laptops
        },
    },
})

-------------------------------- KEYBINDINGS  ----------------------------------
local mainMod = "SUPER"

-- Core System Bindings
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + G", hl.dsp.layout("togglesplit")) -- Dwindle split orientation (re-mapped to G!)
hl.bind(mainMod .. " + M", hl.dsp.exit())                -- Clean logout

-- Vim-style Focus Navigation (Pristine and uninterrupted HJKL)
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

-- Numeric Workspace Switching 
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-------------------------------- HARDWARE KEYS  --------------------------------
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl set 5%+"),                          { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"),                          { locked = true, repeating = true })

-- Media routing (Playerctl)
hl.bind("XF86AudioPlay",         hl.dsp.exec_cmd("playerctl play-pause"),                           { locked = true })
hl.bind("XF86AudioNext",         hl.dsp.exec_cmd("playerctl next"),                                 { locked = true })
hl.bind("XF86AudioPrev",         hl.dsp.exec_cmd("playerctl previous"),                             { locked = true })

--------------------------------  WINDOW RULES  --------------------------------
hl.window_rule({
    name = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})
