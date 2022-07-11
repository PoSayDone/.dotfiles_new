local autocmd = vim.api.nvim_create_autocmd
local opt = vim.opt

-- autocmds
autocmd("FileType", {
   pattern = "norg",
   callback = function()
      -- vim.opt.laststatus = 0
      opt.number = false
      opt.showtabline = 0
      opt.cole = 1
      opt.foldlevel = 10
   end,
})
vim.opt.langmap="ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"
vim.opt.guifont="JetBrainsMono Nerd Font Mono:h12"
vim.opt.nuw=6
vim.g.neovide_transparency=0.7

function Sed(from, to, fname)
  vim.cmd(string.format("silent !sed -i 's/%s/%s/g' %s", from, to, fname))
  vim.cmd(string.format("silent !xrdb merge ~/.Xresources && kill -USR1 $(xprop -id $(xdotool getwindowfocus) | grep '_NET_WM_PID' | grep -oE '[[:digit:]]*$')"))
end

function DecreasePadding()
  Sed('st.borderpx: 20', 'st.borderpx: 0', '~/.Xresources')
end

function IncreasePadding()
  Sed('st.borderpx: 0', 'st.borderpx: 20', '~/.Xresources')
end

vim.cmd[[
  augroup ChangeStPadding
   au!
   au VimEnter * lua DecreasePadding()
   au VimLeavePre * lua IncreasePadding()
  augroup END
]]
