vim.pack.add(
    {
        { src = "https://github.com/projekt0n/github-nvim-theme.git" },
    },
    { confirm = false }
)

require('github-theme').setup({
    options = {
        transparent = true,
        dim_inactive = true,
    },
    palettes = {},
    specs = {},
    groups = {
        all = {
            FloatBorder = { fg = 'fg1', bg = 'NONE' }
        }
    },
})

vim.cmd('colorscheme github_dark_default')
