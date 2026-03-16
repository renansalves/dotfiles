vim.lsp.enable('lua_ls')
vim.lsp.enable('ts_ls')
vim.lsp.enable('jdtls')

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client:supports_method('textDocument/completion') then
			vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
			vim.keymap.set('i', '<C-Space>', function()
				vim.lsp.completion.get()
			end)
		end
	end,
})

vim.api.nvim_create_autocmd('LspProgress', {
--	buffer = buf,
	callback = function(ev)
		local value = ev.data.params.value
		vim.api.nvim_echo({ { value.message or 'done' } }, false, {
			id = 'lsp',
			kind = 'progress',
			title = value.title,
			status = value.kind ~= 'end' and 'running' or 'success',
			percent = value.percentage,
		})
	end,
})
vim.diagnostic.config({
	virtual_lines = {
		current_line = true,
	},

})

