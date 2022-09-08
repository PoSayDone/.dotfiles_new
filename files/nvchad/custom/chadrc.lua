local M = {}
local override = require "custom.override"
local userHighlights = require "custom.highlights"
local userPlugins = require "custom.plugins"

M.plugins = {

  override = {
    ["kyazdani42/nvim-tree.lua"] = override.nvimtree,
    ["nvim-treesitter/nvim-treesitter"] = override.treesitter,
    ["lukas-reineke/indent-blankline.nvim"] = override.blankline,
    ["goolord/alpha-nvim"] = override.alpha,
    ["williamboman/mason.nvim"] = override.mason,
    ["NvChad/ui"] = {
       tabufline = {
          lazyload = false, -- to show tabufline by default
       },
    },
  },

  user = userPlugins,
}

M.ui = {
  theme = "gruvchad",
  hl_add = require("custom.highlights").new_hlgroups,
  theme_toggle = { "gruvchad", "gruvbox_light" },
  hl_override = require("custom.highlights").overriden_hlgroups,
}

M.ui = {
  theme = "onedark",
  transparency = true,
  hl_override = userHighlights,
  theme_toggle = { "onedark", "one_light" },
}

M.mappings = require "custom.mappings"

return M
