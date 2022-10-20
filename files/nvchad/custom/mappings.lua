local M = {}

M.cmp = {
    i = {
        ["<Down>"]= { "<Cmd>lua require('cmp').select_next_item()<CR>", "cmp next item" },
        ["<Up>"] = { "<Cmd>lua require('cmp').select_prev_item()<CR>", "cmp prev item" },
        ["<S-Tab>"]= { "<Cmd>lua require('cmp').select_next_item()<CR>", "cmp next item" },
    },
}

M.workspaces = {
   n = {
       ["<leader>wa"] = { "<cmd> WorkspacesAdd<CR>", "   add workspace folder" },
       ["<leader>wr"] = { "<cmd> WorkspacesRemove<CR>", "   remove workspace folder" },
       ["<leader>wl"] = { "<cmd> Telescope workspaces<CR>","   list workspace folders" },
   },
}

M.codetests = {
    n = {
       ["<leader>st"] = { "<cmd> TestNearest<CR>","Test Nearest" },
       ["<leader>sT"] = { "<cmd> TestFile<CR>","Test File" },
       ["<leader>sa"] = { "<cmd> TestSuite<CR>","Test Suite" },
       ["<leader>sl"] = { "<cmd> TestLast<CR>","Test Last" },
       ["<leader>sg"] = { "<cmd> TestVisit<CR>","Test Visit" },
    },
}

M.codeactions = {
    n = {
       ["<M-CR>"] = { "<cmd>lua vim.lsp.buf.code_action()<CR>","CodeActions" },
    },
}

M.general = {
  n = {
    [";"] = { ":", "command mode", opts = { nowait = true } },
    ["<Leader>q\""] = { "ciw\"\"<Esc>P", "Double Quote the word"},
    ["<Leader>q\'"] = { "ciw\'\'<Esc>P", "Double Quote the word"},
  },

  i = {
    ["jk"] = { "<ESC>", "escape vim" },
  },
}

M.venn = {
  n = {
    ["vn"] = {
      function()
        require("custom.plugins.venn").toggle_maps()
      end,
      "toggle venn mappings",
    },
  },
}

M.truzen = {
  n = {
    ["<leader>ta"] = { "<cmd> TZAtaraxis <CR>", "truzen ataraxis" },
    ["<leader>tm"] = { "<cmd> TZMinimalist <CR>", "truzen minimal" },
    ["<leader>tf"] = { "<cmd> TZFocus <CR>", "truzen focus" },
  },
}

M.treesitter = {
  n = {
    ["<leader>cu"] = { "<cmd> TSCaptureUnderCursor <CR>", "find media" },
  },
}

M.shade = {
  n = {
    ["<leader>s"] = {
      function()
        require("shade").toggle()
      end,

      "toggle shade.nvim",
    },
  },
}


M.navigation = {
  n = {
    ["H"] = { "^", "beginning of line" },
    ["L"] = { "$", "end of line" },
  }
}

return M
