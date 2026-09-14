return {
  {
    "omacom/aether.nvim",
    branch = "v3",
    name = "aether",
    priority = 1000,
    opts = {
      colors = {
        bg         = "#06041A",
        dark_bg    = "#050314",
        darker_bg  = "#03020d",
        lighter_bg = "#1f1d31",

        fg         = "#F7B377",
        dark_fg    = "#b98659",
        light_fg   = "#f8be8b",
        bright_fg  = "#f9c699",
        muted      = "#5d5d63",

        red        = "#be594b",
        yellow     = "#ffbf65",
        orange     = "#c87266",
        green      = "#eb8e57",
        cyan       = "#8271c3",
        blue       = "#826ec0",
        purple     = "#996aa7",
        brown      = "#78443d",

        bright_red    = "#ed7966",
        bright_yellow = "#ffc800",
        bright_green  = "#ffaf66",
        bright_cyan   = "#a891f9",
        bright_blue   = "#a88df6",
        bright_purple = "#c289d8",

        accent               = "#826ec0",
        cursor               = "#F7B377",
        foreground           = "#F7B377",
        background           = "#06041A",
        selection             = "#1f1d31",
        selection_foreground = "#F7B377",
        selection_background = "#1f1d31",
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
