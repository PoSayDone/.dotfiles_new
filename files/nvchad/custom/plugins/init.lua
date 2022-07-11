return {
   ["nvim-treesitter/nvim-treesitter"] = {
      event = { "BufRead", "BufNewFile" },
      run = ":TSUpdate",
      config = function()
         require "custom.plugins.treesitter"
      end,
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

   ["Pocco81/AutoSave.nvim"] = {
   config = function()
      local autosave = require "autosave"
      autosave.setup {
         enabled = true,
         execution_message = "autosaved at : " .. vim.fn.strftime "%H:%M:%S",
         events = { "InsertLeave", "TextChanged" },
         conditions = {
            exists = true,
            filetype_is_not = {},
            modifiable = true,
         },
         clean_command_line_interval = 2500,
         on_off_commands = true,
         write_all_buffers = false,
      }
   end,
  },

  ["goolord/alpha-nvim"] = {
    disable = false,
    config = function()
       require("custom.plugins.alpha")
    end,
  },

   ["williamboman/nvim-lsp-installer"] = {

   },

   ["nvim-treesitter/playground"] = {

   },

   ["p00f/nvim-ts-rainbow"] = {

   },

   ["windwp/nvim-ts-autotag"] = {
      ft = { "html", "javascriptreact" },
      after = "nvim-treesitter",
      config = function()
         require("nvim-ts-autotag").setup()
      end,
   },

   ["jose-elias-alvarez/null-ls.nvim"] = {
      after = "nvim-lspconfig",
      config = function()
         require("custom.plugins.null-ls").setup()
      end,
   },

   ["nvim-telescope/telescope-media-files.nvim"] = {
      after = "telescope.nvim",
      config = function()
         require("telescope").setup {
            extensions = {
               media_files = {
                  filetypes = { "png", "webp", "jpg", "jpeg" },
               },

               workspaces = {
                 keep_insert = true,
               },
               -- fd is needed
            },
         }
         require("telescope").load_extension "media_files"
         require("telescope").load_extension "workspaces"
      end,
   },

   ["Pocco81/TrueZen.nvim"] = {
      cmd = {
         "TZAtaraxis",
         "TZMinimalist",
         "TZFocus",
      },
      config = function()
         require "custom.plugins.truezen"
      end,
   },
}
