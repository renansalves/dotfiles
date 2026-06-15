vim.lsp.enable('lua_ls')
vim.lsp.enable('ts_ls')
vim.lsp.enable('jdtls')
vim.lsp.enable('wc_language_server')


vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		local buf = ev.buf
		local map = function(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, { buffer = buf, desc = desc })
		end

		map('n', 'gd', vim.lsp.buf.definition, 'Go to definition')
		map('n', 'gD', vim.lsp.buf.declaration, 'Go to declaration')
		map('n', 'gi', vim.lsp.buf.implementation, 'Go to implementation')
		map('n', 'gr', vim.lsp.buf.references, 'Go to references')
		map('n', 'K', vim.lsp.buf.hover, 'Hover documentation')
		map('n', '<C-k>', vim.lsp.buf.signature_help, 'Signature help')
		map('n', '[d', vim.diagnostic.goto_prev, 'Previous diagnostic')
		map('n', ']d', vim.diagnostic.goto_next, 'Next diagnostic')
		map('n', '<leader>ca', vim.lsp.buf.code_action, 'Code actions')

		if client:supports_method('textDocument/completion') then
			vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
			vim.lsp.completion.enable(true, client.id, buf, { autotrigger = true })
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
			source = 'lsp_progress',
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

