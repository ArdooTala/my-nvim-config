vim.lsp.enable({ 'luals', 'clangd', })


vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('my.lsp', {}),
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        -- if client:supports_method('textDocument/implementation') then
        --     -- Create a keymap for vim.lsp.buf.implementation ...
        -- end

        -- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
        if client:supports_method('textDocument/completion') then
            -- Optional: trigger autocompletion on EVERY keypress. May be slow!
            -- local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
            -- client.server_capabilities.completionProvider.triggerCharacters = chars
            vim.opt.completeopt = { 'fuzzy', 'noinsert', 'menu', 'menuone', }
            vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = false })
            vim.keymap.set('i', 'C-S', function() vim.lsp.completion.get() end)
        end

        -- Auto-format ("lint") on save.
        -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
        -- if client:supports_method('textDocument/formatting') then
        --     vim.keymap.set('n', '<leader>f', function()
        --         vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 999 })
        --     end, { desc = '[F]ormat buffer' })
        -- end
    end,
})

vim.diagnostic.config({
    -- Default:
    -- Virtual_lines = true,
    virtual_lines = {
        -- Only show diagnostics on the current line
        current_line = true,
    },
})
