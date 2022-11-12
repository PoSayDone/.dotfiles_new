local overrides = require "custom.plugins.overrides"

return {
----------------------------------------- default plugins ------------------------------------------
   ["NvChad/ui"] = {
        override_options = overrides.ui
    },
    ["folke/which-key.nvim"] = {
        disable = false,
    },

    ["goolord/alpha-nvim"] = {
        disable = false,
        config = function()
            require("custom.plugins.alpha")
        end
    },

    ["neovim/nvim-lspconfig"] = {
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.plugins.lspconfig"
        end
    },

    -- override default configs
    ["nvim-telescope/telescope.nvim"] = {
        override_options = overrides.telescope
    },

    ["kyazdani42/nvim-tree.lua"] = {
        override_options = overrides.nvimtree
    },

    ["nvim-treesitter/nvim-treesitter"] = {
        override_options = overrides.treesitter
    },

    ["lukas-reineke/indent-blankline.nvim"] = {
        override_options = overrides.blankline
    },

    ["williamboman/mason.nvim"] = {
        override_options = overrides.mason
    },

   ["hrsh7th/nvim-cmp"] = {
    override_options = function()
      local cmp = require "cmp"

      return {
        mapping = {
          ["<Tab>"] = cmp.config.disable,
          ["<S-Tab>"] = cmp.config.disable,
        },
      }
    end,
  },
    --------------------------------------------- custom plugins ----------------------------------------------

    ["lervag/vimtex"] = { },

    ["vim-test/vim-test"] = { },

    ["lyokha/vim-xkbswitch"] = { },

    ["weilbith/nvim-code-action-menu"] = { },

    --workspaces plugin
    ["natecraddock/workspaces.nvim"] = {
    override_options = overrides.workspaces
    },

    -- autoclose tags in html, jsx only
    ["windwp/nvim-ts-autotag"] = {
        ft = {"html", "javascriptreact"},
        after = "nvim-treesitter",
        config = function()
            local present, autotag = pcall(require, "nvim-ts-autotag")

            if present then
                autotag.setup()
            end
        end
    },

    -- format & linting
    ["jose-elias-alvarez/null-ls.nvim"] = {
        after = "nvim-lspconfig",
        config = function()
            require "custom.plugins.null-ls"
        end
    },

    -- distraction free modes
    ["Pocco81/TrueZen.nvim"] = {
        cmd = {
            "TZAtaraxis",
            "TZMinimalist",
            "TZFocus"
        },
        config = function()
            require "custom.plugins.truezen"
        end
    },

    -- get highlight group under cursor
    ["nvim-treesitter/playground"] = {
        cmd = "TSCaptureUnderCursor",
        config = function()
            require("nvim-treesitter.configs").setup()
        end
    },

    -- I rarely use shade.nvim/autosave.nvim so made commands to enable them

    -- dim inactive windows
    ["andreadev-it/shade.nvim"] = {
        module = "shade",
        config = function()
            require "custom.plugins.shade"
        end
    },

    -- autosave
    ["Pocco81/auto-save.nvim"] = {
        config = function()
            require("auto-save").setup()
        end
    },

    -- notes & todo stuff
    ["nvim-neorg/neorg"] = {
        tag = "0.0.12",
        ft = "norg",
        after = "nvim-treesitter",
        setup = function()
            require("custom.plugins.neorg").autocmd()
        end,
        config = function()
            require("custom.plugins.neorg").setup()
        end
    },

    -- basic diagrams for flow charts etc
    ["jbyuki/venn.nvim"] = {
        module = "venn.nvim",
        config = function()
            require("custom.plugins.venn").setup()
        end
    }
}
