local present, treesitter = pcall(require, "nvim-treesitter.configs")

if not present then
   return
end

local options = {
  ensure_installed = {
    "lua",
    "vim",
  },

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }
}

treesitter.setup(options)
