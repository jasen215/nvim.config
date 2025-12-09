return {
	-- Vscode-like pictograms
	{
		"onsails/lspkind.nvim",
		event = { "VimEnter" },
	},
	{
		"folke/trouble.nvim",
		config = function()
			require("config.trouble")
		end,
	},
	-- File explorer
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			-- "nvim-tree/nvim-web-devicons",
		},
		config = function(_, opts)
			require("nvim-tree").setup(opts)

			local map = vim.api.nvim_set_keymap
			local nvim_tree_opts = { noremap = true, silent = true }
			map("n", "<leader>d", ":NvimTreeToggle<CR>", nvim_tree_opts)
			map("n", "<leader>f", ":NvimTreeFindFile<CR>", nvim_tree_opts)
		end,
		opts = {
			-- disable git
			git = { enable = false },
			renderer = {
				icons = {
					show = {
				        file = false,
				        folder = false,
				        folder_arrow = true,
				        modified = true,
					},
					glyphs = {
						modified = "*",
						folder = {
							arrow_closed = "+",
							arrow_open = "-",
						}
					}
				}
			},
			modified = {
		        enable = true,
		        show_on_dirs = true,
		        show_on_open_dirs = true,
		    }
		},
	},
	-- Fuzzy finder
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function(_, opts)
			local telescope = require("telescope")
			telescope.setup(opts)

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<C-p>", builtin.find_files, {})
			vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
			vim.keymap.set("n", "<leader>r", builtin.treesitter, {})
			vim.keymap.set("n", "<leader>td", ":Telescope diagnostics<CR>", { noremap = true, silent = true })
		end,
		opts = {
			defaults = {
				disable_devicons = true,
				file_ignore_patterns = {
					"node_modules",
					"build",
					"dist",
					"yarn.lock",
					".git",
				},
				preview = {
					hide_on_startup = true,
				},
			},
		},
	},
	-- Status line
	{
		"nvim-lualine/lualine.nvim",
		-- dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local custom_theme = require("lualine.themes.auto")
			custom_theme.insert.c.bg = "#008ffd"
			custom_theme.visual.c.bg = "#008ffd"
			custom_theme.replace.c.bg = "#008ffd"
			custom_theme.normal.c.bg = "#008ffd"
			custom_theme.inactive.c.bg = "#008ffd"
			custom_theme.terminal.c.bg = "#008ffd"
			custom_theme.command.c.bg = "#008ffd"
			custom_theme.insert.c.fg = "#ffffff"
			custom_theme.visual.c.fg = "#ffffff"
			custom_theme.replace.c.fg = "#ffffff"
			custom_theme.normal.c.fg = "#ffffff"
			custom_theme.inactive.c.fg = "#ffffff"
			custom_theme.terminal.c.fg = "#ffffff"
			custom_theme.command.c.fg = "#ffffff"

			require("lualine").setup({
				options = {
					theme = custom_theme,
					disabled_filetypes = { "Outline", "NvimTree" },
					icons_enabled = false,
					component_separators = "",
					section_separators = "",
				},
				tabline = {
					lualine_a = { { "buffers", show_filename_only = false, show_modified_status = false, mode = 2 } },
					lualine_z = { "tabs" },
				},
			})
		end,
	},
	-- Show indentation and blankline
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			indent = { char = "╎" },
		},
	},
	-- local plugins need to be explicitly configured with dir
	{ "jasen215/oneleaf.vim" },
	"ap/vim-css-color",
}
