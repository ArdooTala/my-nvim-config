vim.pack.add({"https://github.com/nvim-lualine/lualine.nvim.git"})
require("lualine").setup({
  options = {
    icons_enabled = false,
    theme = 'nord',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
  }
})

