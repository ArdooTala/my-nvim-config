vim.pack.add(
    {
        { src = "https://github.com/nvim-lua/plenary.nvim" },
        { src = "https://github.com/nvim-telescope/telescope.nvim" },
    },
    { confirm = false }
)


-- event = 'VimEnter',
-- dependencies = {
--     'nvim-lua/plenary.nvim',
--     { -- If encountering errors, see telescope-fzf-native README for installation instructions
--         'nvim-telescope/telescope-fzf-native.nvim',
--
--         -- `build` is used to run some command when the plugin is installed/updated.
--         -- This is only run then, not every time Neovim starts up.
--         build = 'make',
--
--         -- `cond` is a condition used to determine whether this plugin should be
--         -- installed and loaded.
--         cond = function()
--             return vim.fn.executable 'make' == 1
--         end,
--     },
--     { 'nvim-telescope/telescope-ui-select.nvim' },
--
--     -- Useful for getting pretty icons, but requires a Nerd Font.
--     { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
-- },

require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                ["<C-h>"] = "which_key"
            }
        },
        layout_strategy = "vertical",
    },
    pickers = {
        find_files = {
            path_display = { 'filename_first', 'truncate' },
        },
        git_files = {
            path_display = { 'filename_first', 'truncate' },
        }
    },
    extensions = {
        -- Your extension configuration goes here:
        ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
        },
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
    }
}

-- Two important keymaps to use while in Telescope are:
--  - Insert mode: <c-/>
--  - Normal mode: ?

-- Enable Telescope extensions if they are installed
pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'ui-select')

-- See `:help telescope.builtin`
local builtin = require 'telescope.builtin'
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sF', builtin.git_files, { desc = '[S]earch Git [F]iles' })
vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>sq', builtin.quickfix, { desc = '[S]earch Quickfix' })
vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

vim.keymap.set('n', '<leader>rr', builtin.lsp_references, { desc = 'Telescope - lsp_references' })
vim.keymap.set('n', '<leader>rd', builtin.lsp_definitions, { desc = 'Telescope - lsp_definitions' })
vim.keymap.set('n', '<leader>ri', builtin.lsp_implementations, { desc = 'Telescope - lsp_implementations' })
vim.keymap.set('n', '<leader>rt', builtin.lsp_type_definitions, { desc = 'Telescope - lsp_type_definitions' })
vim.keymap.set('n', '<leader>rs', builtin.lsp_document_symbols, { desc = 'Telescope - lsp_document_symbols' })
vim.keymap.set('n', '<leader>rS', builtin.lsp_workspace_symbols, { desc = 'Telescope - lsp_workspace_symbols' })

-- Slightly advanced example of overriding default behavior and theme
vim.keymap.set('n', '<leader>/', function()
    -- You can pass additional configuration to Telescope to change the theme, layout, etc.
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = '[/] Fuzzily search in current buffer' })

-- It's also possible to pass additional configuration options.
--  See `:help telescope.builtin.live_grep()` for information about particular keys
vim.keymap.set('n', '<leader>s/', function()
    builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
    }
end, { desc = '[S]earch by [/]grep in Open Files' })

-- Shortcut for searching your Neovim configuration files
vim.keymap.set('n', '<leader>sn', function()
    builtin.find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = '[S]earch [N]eovim files' })
