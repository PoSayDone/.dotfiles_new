local M = {}

local plugin_conf = require "custom.plugins.configs"
local userPlugins = require "custom.plugins"
local userMappings = require "custom.mappings"
local userHighlights = require "custom.highlights"

M.plugins = {
   status = {
     alpha =true
   },

   options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
      },

   },

   override = {
      ["kyazdani42/nvim-tree.lua"] = plugin_conf.nvimtree,
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
