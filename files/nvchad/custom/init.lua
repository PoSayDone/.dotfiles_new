require "custom.mappings"
local opt     = vim.opt

opt.langmap="ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"

function Sad(line_nr, from, to, fname)
  vim.cmd(string.format("silent !sed -i '%ss/%s/%s/' %s", line_nr, from, to, fname)) 
end

function IncreasePadding() 
  Sad('25', 0, 10, '~/.config/bspwm/alacritty/alacritty.yml')
  Sad('26', 0, 10, '~/.config/bspwm/alacritty/alacritty.yml')
end

function DecreasePadding()
  Sad('25', 10, 0, '~/.config/bspwm/alacritty/alacritty.yml')
  Sad('26', 10, 0, '~/.config/bspwm/alacritty/alacritty.yml')
end

vim.cmd[[
  augroup ChangeAlacrittyPadding
   au! 
   au VimEnter * lua DecreasePadding()
   au VimLeavePre * lua IncreasePadding()
  augroup END 
]]
