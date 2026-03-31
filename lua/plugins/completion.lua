return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",  -- LSP source for nvim-cmp
      "L3MON4D3/LuaSnip",      -- snippet engine (optional but recommended)
      "saadparwaiz1/cmp_luasnip", -- snippet completions
      "hrsh7th/cmp-buffer",    -- buffer words
      "hrsh7th/cmp-path",      -- file paths
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = {
          { name = "nvim_lsp" },
        },
        completion = {
          autocomplete = { cmp.TriggerEvent.TextChanged },
        },
      })
    end,
  },
}
