-- custom.mappings

local M = {}

M.workspaces = {
   n = {
       ["<leader>wa"] = { "<cmd> WorkspacesAdd<CR>", "   add workspace folder" },
       ["<leader>wr"] = { "<cmd> WorkspacesRemove<CR>", "   remove workspace folder" },
       ["<leader>wl"] = { "<cmd> Telescope workspaces<CR>","   list workspace folders" },
       ["<leader>st"] = { "<cmd> TestNearest","Test Nearest" },
       ["<leader>sT"] = { "<cmd> TestFile","Test File" },
       ["<leader>sa"] = { "<cmd> TestSuite","Test Suite" },
       ["<leader>sl"] = { "<cmd> TestLast","Test Last" },
       ["<leader>sg"] = { "<cmd> TestVisit","Test Visit" },
   },
}

return M
