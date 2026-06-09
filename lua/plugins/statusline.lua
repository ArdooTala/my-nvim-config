vim.pack.add(
    {
        { src = "https://github.com/nvim-lualine/lualine.nvim.git" },
    },
    { confirm = false }
)

require("lualine").setup({
    options = {
        icons_enabled = false,
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        theme = 'nord',
        -- theme = 'auto',
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = false,
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {
            {
                'filename',
                path = 1,
            }
        },
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = { 'lsp_status' },
        lualine_z = {'location', 'progress'}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
    })
