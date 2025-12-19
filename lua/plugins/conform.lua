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
    },
})
