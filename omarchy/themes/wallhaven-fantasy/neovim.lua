return {
  {
    "omacom/aether.nvim",
    branch = "v3",
    name = "aether",
    priority = 1000,
    opts = {
      colors = {
        bg         = "#040710",
        dark_bg    = "#03050c",
        darker_bg  = "#020408",
        lighter_bg = "#1d2028",

        fg         = "#cfd8e9",
        dark_fg    = "#9ba2af",
        light_fg   = "#d6deec",
        bright_fg  = "#dbe2ef",
        muted      = "#5b5d63",

        red        = "#749cef",
        yellow     = "#6ab368",
        orange     = "#6d8a47",
        green      = "#e47c77",
        cyan       = "#309132",
        blue       = "#4775d8",
        purple     = "#d15453",
        brown      = "#985f42",

        bright_red    = "#96bfff",
        bright_yellow = "#87dd78",
        bright_green  = "#ff9d97",
        bright_cyan   = "#4bbb30",
        bright_blue   = "#6896ff",
        bright_purple = "#ff7471",

        accent               = "#4775d8",
        cursor               = "#cfd8e9",
        foreground           = "#cfd8e9",
        background           = "#040710",
        selection             = "#1d2028",
        selection_foreground = "#cfd8e9",
        selection_background = "#1d2028",
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
