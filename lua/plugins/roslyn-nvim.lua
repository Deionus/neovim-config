return {
  {
    "seblyng/roslyn.nvim",
    ---@module 'roslyn.config'
    ---@type RoslynNvimConfig
    ft = { "cs", "razor" },
    opts = {
      -- your configuration comes here; leave empty for default settings
    },
    config = function()
      local cmp_lsp = require("cmp_nvim_lsp")
      vim.lsp.config("roslyn", {
        capabilities = cmp_lsp.default_capabilities(),
      })
    end,
  },
}
