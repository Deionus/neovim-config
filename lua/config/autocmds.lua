-- Start treesitter when .cs file is opened
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'cs' },
  callback = function() vim.treesitter.start() end,
})

-- Highlight when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

