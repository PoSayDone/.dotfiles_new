-- custom.mappings

local M = {}

M.workspaces = {
   n = {
       ["<leader>wa"] = { "<cmd> WorkspacesAdd<CR>", "   add workspace folder" },
       ["<leader>wr"] = { "<cmd> WorkspacesRemove<CR>", "   remove workspace folder" },
       ["<leader>wl"] = { "<cmd> Telescope workspaces<CR>","   list workspace folders" },
       ["<leader>st"] = { "<cmd> TestNearest<CR>","Test Nearest" },
       ["<leader>sT"] = { "<cmd> TestFile<CR>","Test File" },
       ["<leader>sa"] = { "<cmd> TestSuite<CR>","Test Suite" },
       ["<leader>sl"] = { "<cmd> TestLast<CR>","Test Last" },
       ["<leader>sg"] = { "<cmd> TestVisit<CR>","Test Visit" },
       ["<M-CR>"] = { "<cmd> CodeActionMenu<CR>","Test Visit" },
   },
}

return M
