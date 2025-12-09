local none_ls_ok, none_ls = pcall(require, "none-ls")
if not none_ls_ok then
	return
end

-- For more information, see https://github.com/nvimtools/none-ls.nvim

local sources = {
	-- Formatters
	none_ls.builtins.formatting.black,
	none_ls.builtins.formatting.stylua,
	none_ls.builtins.formatting.ocamlformat.with({
		extra_args = {
			"--if-then-else",
			"vertical",
			"--break-cases",
			"fit-or-vertical",
			"--type-decl",
			"sparse",
		},
	}),

	-- Linters (add any linters here if you had them before)
}

none_ls.setup({
	sources = sources,
})
