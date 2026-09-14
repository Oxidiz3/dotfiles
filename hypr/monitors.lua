-- List current monitors and supported resolutions with: hyprctl monitors all
-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

local omarchy_gdk_scale = 2
local omarchy_monitor_scale = 1.6

hl.env("GDK_SCALE", tostring(omarchy_gdk_scale))
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = omarchy_monitor_scale })

-- Configure a specific monitor.
-- hl.monitor({ output = "DP-2", mode = "2560x1440@144", position = "0x0", scale = 1 })

-- Portrait/rotated secondary monitor (transform: 1 = 90°, 3 = 270°), left of the main monitor.
hl.monitor({ output = "DP-3", mode = "3840x2160@144", position = "0x0", scale = 2, transform = 3 })

-- Main monitor, to the right of DP-3 (DP-3 logical width is 1080 when rotated).
hl.monitor({ output = "HDMI-A-1", mode = "3840x2160@144", position = "1080x0", scale = omarchy_monitor_scale, bitdepth = 10, cm = "hdr", sdrbrightness = 1.2, sdrsaturation=1.2 })

-- Bind workspaces 4 and 5 to the secondary monitor.
hl.workspace_rule({ workspace = "1", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "2", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "3", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "4", monitor = "DP-3" })
hl.workspace_rule({ workspace = "5", monitor = "DP-3" })
