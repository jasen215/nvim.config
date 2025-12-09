return {
	-- Treesitter-integration
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				ensure_installed = {
					"c",
					"lua",
					"vim",
					"vimdoc",
					"query",
					"elixir",
					"heex",
					"javascript",
					"html",
					"c",
					"lua",
					"vim",
					"yaml",
					"toml",
					"scheme",
					"scala",
					"rust",
					"python",
					"ocaml",
					"make",
					"json",
					"llvm",
					"dockerfile",
					"git_rebase",
					"gitcommit",
					"gitattributes",
					"gitignore",
					"gomod",
					"go",
					"comment", -- for tags like TODO:, FIXME(user)
					"diff", -- git diff
					"markdown_inline",
				},
				ignore_install = {},
				modules = {},
				sync_install = false,
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
