require("config.lazy")

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'cs' },
  callback = function() vim.treesitter.start() end,
})

vim.lsp.config("roslyn", {
    on_attach = function()
        print("Roslyn Attached!")
    end,
    settings = {
        ["csharp|inlay_hints"] = {
            csharp_enable_inlay_hints_for_implicit_object_creation = true,
            csharp_enable_inlay_hints_for_implicit_variable_types = true,
        },
        ["csharp|code_lens"] = {
            dotnet_enable_references_code_lens = true,
        },
    },
})

vim.opt.termguicolors = true

vim.cmd[[colorscheme tokyonight]]

vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
