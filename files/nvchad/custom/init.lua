-- commands

-- I dont use shade.nvim/autosave.nvim all the time so made commands for them
-- So this makes easy to lazy load them at cmds

local new_cmd = vim.api.nvim_create_user_command
local api = vim.api

new_cmd("EnableShade", function()
  require("shade").setup()
end, {})

new_cmd("EnableAutosave", function()
  require("autosave").setup()
end, {})

local autocmd = api.nvim_create_autocmd
local opt_local = vim.opt_local

-- autocmds
-- pretty up norg ft!
autocmd("FileType", {
  pattern = "norg",
  callback = function()
    opt_local.number = false
    opt_local.cole = 1
    opt_local.foldlevel = 10
    opt_local.foldenable = false
    opt_local.signcolumn = "yes:2"
  end,
})

vim.wo.linebreak = false
vim.wo.wrap = false
vim.opt.shiftwidth = 2
opt_local.langmap = "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"
vim.g.XkbSwitchEnabled = 1
vim.g.XkbSwitchMappings = 'ru'
vim.opt.numberwidth = 5
