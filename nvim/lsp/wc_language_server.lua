return {
	cmd = { 'wc-language-server', '--stdio' },
	filetypes = { "html", "javascriptreact", "typescriptreact", "astro", "svelte", "vue", "markdown", "mdx", "javascript", "typescript", "css", "scss", "less" },
	commands = {
		--    ["editor.action.showReferences"] = <function 1>
	},
	root_markers = { "wc.config.js", "wc.config.ts", "wc.config.mjs", "wc.config.cjs", "custom-elements.json", "package.json", ".git" },
	handlers =
	{
		-- ["_typescript.rename"] = <function 1>
	},
	init_options = {
		hostInfo = "neovim"
	}
}
