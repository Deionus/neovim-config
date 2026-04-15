return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000, -- load before all other plugins
    opts = { style = "night" },
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight]])
    end,
  }
}
