local M = {}

local userPlugins = require "custom.plugins"
local userMappings = require "custom.mappings"
local userHighlights = require "custom.highlights"
local override = require "custom.override"

M.plugins = {

  options = {
      lspconfig = {
        setup_lspconf = "custom.plugins.lspconfig",
      },
  },

   status = {
     alpha =true
   },

   override = {
      ["kyazdani42/nvim-tree.lua"] = override.nvimtree,
      ["nvim-treesitter/nvim-treesitter"] = override.treesitter,
      ["lukas-reineke/indent-blankline.nvim"] = override.blankline,
   },

   user = userPlugins,
}

M.ui = {
  theme = "onedark",
  transparency = true,
  hl_override = userHighlights,
  theme_toggle = { "onedark", "one_light" },
}

M.mappings = userMappings

return M
