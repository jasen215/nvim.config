return {
	{
		"vimlab/split-term.vim",
		config = function()
			vim.keymap.set("n", "<leader>t", ":10Term<CR>", { noremap = true, silent = true })
		end,
	},
	"numToStr/Comment.nvim",
	-- Autopairs: [], (), "", '', etc
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	-- Markdown support
	{ "preservim/vim-markdown", ft = { "markdown" } },
	-- Flutter-tools
	{
		"akinsho/flutter-tools.nvim",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim", -- optional for vim.ui.select
		},
		config = true,
	},
}
