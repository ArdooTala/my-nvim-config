vim.pack.add(
    {
        {src="https://github.com/nvim-treesitter/nvim-treesitter.git", version="master"},
    },
    {confirm=false}
)

require("nvim-treesitter.configs").setup({
    ensure_installed = { 'bash', 'c', 'cpp', 'python', 'dot', 'diff', 'html',
        'lua', 'luadoc', 'markdown', 'markdown_inline', 'query',
        'vim', 'vimdoc' },
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = { enable = true, disable = { 'ruby' } },
})

vim.api.nvim_create_autocmd('PackChanged', {
    desc = "Handle nvim-treesitter's :TSUpdate after an update",
    group = vim.api.nvim_create_augroup('nvim-treesitter-pack-changed-update-handler', { clear = true }),
    callback = function(event)
        if event.data.kind == 'update' then
            vim.notify("nvim-treesitter is updated...Running :TSUpdate", vim.log.levels.INFO)
            --@diagnostic disable-next-line: param-type-mismatch
            local ok = pcall(vim.cmd, 'TSUpdate')
            if ok then
                vim.notify("TSUpdate succeeded", vim.log.levels.INFO)
            else
                vim.notify("TSUpdate failed", vim.log.levels.WARN)
            end
        end
    end,
})
