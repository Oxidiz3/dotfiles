## Setup .config for compatible apps
```ps
[Environment]::SetEnvironmentVariable(
    "XDG_CONFIG_HOME",
    "$HOME\.config",
    "User"
)
```

## Need to add this to %appdata%/alacritty/alacritty.toml in windows
```Json
[general]
import = [
  "~/.config/alacritty/themes/alacritty-theme/themes/terminal_app.toml",
  "~/.config/alacritty/alacritty.toml"
]
```
