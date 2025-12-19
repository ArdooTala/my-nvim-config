vim.pack.add(
    {
        { src = "https://github.com/stevearc/conform.nvim.git" },
    },
    { confirm = false }
)

require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        json = { "prettierd", "prettier", stop_after_first = true },
        yaml = { "prettierd", "prettier", stop_after_first = true },
        docker = { "dockerfmt" },
        cmake = { "cmake_format", stop_after_first = true }
    },

    default_format_opts = {
        lsp_format = "prefer",
    },
})


vim.keymap.set('n', '<leader>f', function()
    require("conform").format({ timeout_ms = 999 })
end, { desc = '[F]ormat buffer - conform' })
