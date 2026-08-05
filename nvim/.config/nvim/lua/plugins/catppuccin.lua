return {
  -- 1. Configure the Catppuccin plugin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "latte", -- Choose "latte" for the light theme (mocha, macchiato, frappe are dark)
    },
  },

  -- 2. Tell LazyVim to load catppuccin on startup
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}