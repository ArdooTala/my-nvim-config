-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
		desc = 'Highlight when yanking (copying) text',
		group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
		callback = function()
				vim.hl.on_yank()
		end,
})

vim.api.nvim_create_autocmd("WinEnter", {
  pattern = "*",
  callback = function()
    vim.opt_local.cursorline = true
    vim.opt_local.colorcolumn = "80"
    vim.opt_local.relativenumber = true
  end
  -- You might also add WinLeave to disable it
})

vim.api.nvim_create_autocmd("WinLeave", {
  pattern = "*",
  callback = function()
    vim.opt_local.cursorline = false
    vim.opt_local.colorcolumn = ""
    vim.opt_local.relativenumber = false
  end
})
