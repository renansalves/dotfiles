vim.pack.add({
{
  src='http://github.com/nvim-treesitter/nvim-treesitter',
	version="master"
}
})

require'nvim-treesitter'.setup {
  -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
	ensure_installed={
		'lua',
		'javascript',
		'html',
		'typescript',
		'scss'
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
	},

  install_dir = vim.fn.stdpath('data') .. '/site'
}
