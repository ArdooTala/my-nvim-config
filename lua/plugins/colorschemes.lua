vim.pack.add({
    {src="https://github.com/projekt0n/github-nvim-theme.git", confirm=false}
})

require('github-theme').setup({})

vim.cmd ('colorscheme github_dark_default')
