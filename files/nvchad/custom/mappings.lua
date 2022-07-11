-- custom.mappings

local M = {}

M.workspaces = {
   n = {
       ["<leader>wa"] = { "<cmd> WorkspacesAdd<CR>", "   add workspace folder" },
       ["<leader>wr"] = { "<cmd> WorkspacesRemove<CR>", "   remove workspace folder" },
       ["<leader>wl"] = { "<cmd> Telescope workspaces<CR>","   list workspace folders" },
   },
}

return M
