-- overriding default plugin configs!

local M = {}

M.ui = {
    tabufline = {
        lazyload = false,
    },
}

M.treesitter = {
  ensure_installed = {
    "python",
    "vim",
    "css",
    "javascript",
    "json",
    "toml",
    "markdown",
    "c",
    "c_sharp",
    "bash",
    "lua",
    "norg",
  },
}

M.telescope = {
  extensions_list = { "themes", "terms", "workspaces" },
}

M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.blankline = {
  filetype_exclude = {
    "help",
    "terminal",
    "alpha",
    "packer",
    "lspinfo",
    "TelescopePrompt",
    "TelescopeResults",
    "nvchad_cheatsheet",
    "lsp-installer",
    "norg",
    "",
  },
}

M.workspaces = {
  config = function()
    require("workspaces").setup{
      hooks = {
          open = {"Telescope find_files"},
      },
    }
  end,
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "emmet-ls",
    "json-lsp",
    "omnisharp-mono",

    -- shell
    "shfmt",
    "shellcheck",
  },
}

return M
