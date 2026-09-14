return {
  {
    "omacom/aether.nvim",
    branch = "v3",
    name = "aether",
    priority = 1000,
    opts = {
      colors = {
        bg         = "#000407",
        dark_bg    = "#000305",
        darker_bg  = "#000204",
        lighter_bg = "#1a1d20",

        fg         = "#d9e6f5",
        dark_fg    = "#a3adb8",
        light_fg   = "#dfeaf7",
        bright_fg  = "#e3ecf8",
        muted      = "#5e6468",

        red        = "#a7b368",
        yellow     = "#c9d285",
        orange     = "#b4be7f",
        green      = "#b6c377",
        cyan       = "#68d5d7",
        blue       = "#5ebcdc",
        purple     = "#66bee3",
        brown      = "#6c724c",

        bright_red    = "#c8d873",
        bright_yellow = "#d5e35f",
        bright_green  = "#c0d450",
        bright_cyan   = "#25e9ed",
        bright_blue   = "#76deff",
        bright_purple = "#7dddff",

        accent               = "#5ebcdc",
        cursor               = "#d9e6f5",
        foreground           = "#d9e6f5",
        background           = "#000407",
        selection             = "#1a1d20",
        selection_foreground = "#d9e6f5",
        selection_background = "#1a1d20",
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "aether",
    },
  },
}
