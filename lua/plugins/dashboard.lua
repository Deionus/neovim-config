local logo = [[
<-. (`-')_  (`-')  _                 (`-')  _     <-. (`-')  
   \( OO) ) ( OO).-/     .->        _(OO ) (_)       \(OO )_ 
,--./ ,--/ (,------.(`-')----. ,--.(_/,-.\ ,-(`-'),--./  ,-.)
|   \ |  |  |  .---'( OO).-.  '\   \ / (_/ | ( OO)|   `.'   |
|  . '|  |)(|  '--. ( _) | |  | \   /   /  |  |  )|  |'.'|  |
|  |\    |  |  .--'  \|  |)|  |_ \     /_)(|  |_/ |  |   |  |
|  | \   |  |  `---.  '  '-'  '\-'\   /    |  |'->|  |   |  |
`--'  `--'  `------'   `-----'     `-'     `--'   `--'   `--'
]]

logo = logo .. "\n\n"

local quotes = {
  { "The only way to learn a new programming language is by writing programs in it.", "— Dennis Ritchie" },
  { "Simplicity is the soul of efficiency.", "— Austin Freeman" },
  { "Before software can be reusable it first has to be usable.", "— Ralph Johnson" },
  { "Make it work, make it right, make it fast.", "— Kent Beck" },
  { "Any fool can write code that a computer can understand.", "Good programmers write code that humans can understand.", "— Martin Fowler" },
  { "First, solve the problem. Then, write the code.", "— John Johnson" },
  { "Experience is the name everyone gives to their mistakes.", "— Oscar Wilde" },
  { "In order to be irreplaceable, one must always be different.", "— Coco Chanel" },
  { "Java is to JavaScript what car is to Carpet.", "— Chris Heilmann" },
  { "Knowledge is power.", "— Francis Bacon" },
}

math.randomseed(os.time())
local quote = quotes[math.random(#quotes)]
local padded_quote = { "", "", "" }
for _, line in ipairs(quote) do
  table.insert(padded_quote, line)
end

vim.api.nvim_create_user_command("EditConfig", function()
  local config_path = vim.fn.stdpath("config")
  require("telescope.builtin").find_files({
    cwd = config_path,
    prompt_title = "Neovim Config"
  })
end, {})

-- open dashboard after closing lazy
if vim.o.filetype == "lazy" then
  vim.api.nvim_create_autocmd("WinClosed", {
    pattern = tostring(vim.api.nvim_get_current_win()),
    once = true,
    callback = function()
      vim.schedule(function()
        vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
      end)
    end,
  })
end

return {
  {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      theme = 'doom',
      config = {
        vertical_center = true,
        header = vim.split(logo, "\n"), 
        center = {
          { action = 'Telescope find_files',                           desc = " Find File",       icon = " ", key = "f" },
          { action = 'Telescope live_grep',                            desc = " Grep",            icon = " ", key = "g" },
          { action = 'EditConfig',                                     desc = " Config",          icon = " ", key = "c" },
          { action = "Lazy",                                           desc = " Lazy",            icon = "󰒲 ", key = "l" },
          { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit",            icon = " ", key = "q" },
        },
        footer = padded_quote,
      }
    }
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
  },
}
