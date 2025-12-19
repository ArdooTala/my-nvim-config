vim.pack.add({
    {src="https://github.com/nvim-lualine/lualine.nvim.git", confirm=false}
})

require("lualine").setup({
  options = {
    icons_enabled = false,
    theme = 'nord',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
  }
})

