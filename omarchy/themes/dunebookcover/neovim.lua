return {
  {
    "omacom/aether.nvim",
    branch = "v3",
    name = "aether",
    priority = 1000,
    opts = {
      colors = {
        bg         = "#0D0D0D",
        dark_bg    = "#0a0a0a",
        darker_bg  = "#070707",
        lighter_bg = "#252525",

        fg         = "#EBEBEB",
        dark_fg    = "#b0b0b0",
        light_fg   = "#eeeeee",
        bright_fg  = "#f0f0f0",
        muted      = "#68665f",

        red        = "#c58468",
        yellow     = "#ffdf91",
        orange     = "#ce967f",
        green      = "#efb770",
        cyan       = "#ffd362",
        blue       = "#b36670",
        purple     = "#ee8d81",
        brown      = "#7c5a4c",

        bright_red    = "#e69471",
        bright_yellow = "#ffda74",
        bright_green  = "#ffc969",
        bright_cyan   = "#ffe853",
        bright_blue   = "#d47481",
        bright_purple = "#ff9a8b",

        accent               = "#b36670",
        cursor               = "#EBEBEB",
        foreground           = "#EBEBEB",
        background           = "#0D0D0D",
        selection             = "#252525",
        selection_foreground = "#EBEBEB",
        selection_background = "#252525",
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
