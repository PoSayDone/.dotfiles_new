return {
  --unit tests
  ["vim-test/vim-test"] = {

  },

  ["natecraddock/workspaces.nvim"] = {
    config = function()
      require("workspaces").setup{
        hooks = {
            open = {"Telescope find_files"},
        },
      }
    end,
  },

  ["folke/persistence.nvim"] = {
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    module = "persistence",
    config = function()
      require("persistence").setup()
    end,
  },
  -- autoclose tags in html, jsx etc
  ["windwp/nvim-ts-autotag"] = {
    ft = { "html", "javascriptreact" },
    after = "nvim-treesitter",
    config = function()
      require("custom.plugins.smolconfigs").autotag()
    end,
  },

  -- format & linting
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },

  -- minimal modes
  ["Pocco81/true-zen.nvim"] = {
    cmd = {
      "TZAtaraxis",
      "TZMinimalist",
      "TZFocus",
    },
    config = function()
      require "custom.plugins.truezen"
    end,
  },

  -- get highlight group under cursor
  ["nvim-treesitter/playground"] = {
    cmd = "TSCaptureUnderCursor",
    config = function()
      require("nvim-treesitter.configs").setup()
    end,
  },

  -- dim inactive windows
  ["andreadev-it/shade.nvim"] = {
    module = "shade",
    config = function()
      require("custom.plugins.smolconfigs").shade()
    end,
  },

  ["Pocco81/auto-save.nvim"] = {
    module = "autosave",
    config = function()
      require("custom.plugins.smolconfigs").autosave()
    end,
  },

  -- notes stuff
  ["nvim-neorg/neorg"] = {
    ft = "norg",
    after = "nvim-treesitter",
    config = function()
      require "custom.plugins.neorg"
    end,
  },

  ["folke/which-key.nvim"] = {
    disable = false,
    module = "which-key",
    config = function()
      require "plugins.configs.whichkey"
    end,
  },

  ["goolord/alpha-nvim"] = {
    disable = false,
    config = function()
       require("custom.plugins.alpha")
    end,
  },

  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
      require'lspconfig'.omnisharp.setup {
          cmd = { "dotnet", "/home/posaydone/.local/share/nvim/mason/packages/omnisharp/OmniSharp.dll" },
          enable_editorconfig_support = true,
          enable_ms_build_load_projects_on_demand = false,
          enable_roslyn_analyzers = false,
          organize_imports_on_format = false,
          enable_import_completion = false,
          sdk_include_prereleases = true,
          analyze_open_documents_only = false,
      }
    end,
  },
}
