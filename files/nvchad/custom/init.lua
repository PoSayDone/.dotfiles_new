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

local function sed(from, to, fname)
  vim.cmd(string.format("silent !sed -i 's/%s/%s/g' %s", from, to, fname))
  vim.cmd(
    string.format "silent !xrdb merge ~/.Xresources && kill -USR1 $(xprop -id $(xdotool getwindowfocus) | grep '_NET_WM_PID' | grep -oE '[[:digit:]]*$')"
  )
end

autocmd("VimEnter", {
  callback = function()
    sed("st.borderpx: 20", "st.borderpx: 0", "~/.Xresources")
  end,
})

autocmd("VimLeavePre", {
  callback = function()
    sed("st.borderpx: 0", "st.borderpx: 20", "~/.Xresources")
  end,
})
