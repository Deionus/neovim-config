-- Add vim config
require("config.options")
require("config.autocmds")

-- Bootstrap lazy.nvim
require("config.lazy")

-- lsp config
-- should probably live somewhere else, idk where
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

