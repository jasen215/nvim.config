return {
	-- LSP manager, and provides the bridge between mason and lspconfig
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			-- Setup mason
			require("mason").setup({
				ui = {
					border = "rounded",
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			-- FIX: Get capabilities from cmp_nvim_lsp
			local capabilities = require('cmp_nvim_lsp').default_capabilities()

			-- Define the global on_attach function
			-- This will be used for all LSP servers
			local on_attach = function(_, bufnr)
				-- Enable completion triggered by <c-x><c-o>
				vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

				-- Keymaps for LSP actions, scoped to the buffer
				local bufopts = { noremap = true, silent = true, buffer = bufnr }
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
				vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
				vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
				vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
				vim.keymap.set("n", "<space>wl", function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, bufopts)
				vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
				vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
				vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
				-- This one keymap will now serve for both LSP and none-ls formatters
				vim.keymap.set("n", "<space>f", function()
					vim.lsp.buf.format({ async = true })
				end, bufopts)
			end

			-- Keymaps for diagnostics
			local opts = { noremap = true, silent = true }
			vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
			vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)


			-- List of servers to install
			local servers = {
				"gopls",
				"lua_ls",
				"pyright",
				"ruff", -- ruff-lsp is now just 'ruff' in mason
				"rust_analyzer",
				"jsonls",
				"yamlls",
				"sqls",
				"nginx_language_server",
				"html",
			}

			-- Setup mason-lspconfig to automatically install and configure servers
			local lspconfig = require("lspconfig")
			require("mason-lspconfig").setup({
				ensure_installed = servers,
				handlers = {
					function(server_name) -- default handler
						lspconfig[server_name].setup({
							on_attach = on_attach,
							capabilities = capabilities,
						})
					end,
					-- Custom setup for gopls
					["gopls"] = function()
						lspconfig.gopls.setup({
							on_attach = on_attach,
							capabilities = capabilities,
							settings = {
								gopls = {
									analyses = { unusedparams = true },
									staticcheck = true,
									gofumpt = true,
								},
							},
						})
					end,
					-- Custom setup for tsserver (formerly ts_ls)
					["tsserver"] = function()
						lspconfig.tsserver.setup({
							on_attach = on_attach,
							capabilities = capabilities,
							init_options = {
								plugins = {
									{
										name = "@vue/typescript-plugin",
										location = "/Users/jasen/Library/pnpm/global/5/node_modules/@vue/language-server",
										languages = { "vue" },
									},
								},
							},
							filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
						})
					end,
					-- Custom setup for lua_ls
					["lua_ls"] = function()
						lspconfig.lua_ls.setup({
							on_attach = on_attach,
							capabilities = capabilities,
							settings = {
								Lua = {
									runtime = { version = "LuaJIT" },
									diagnostics = { globals = { "vim" } },
									workspace = { library = vim.api.nvim_get_runtime_file("", true) },
									telemetry = { enable = false },
								},
							},
						})
					end,
				},
			})
		end,
	},

	-- Use none-ls to substitute null-ls
	{
		"nvimtools/none-ls.nvim",
		dependencies = { "mason-org/mason.nvim" },
		config = function()
			require("config.none-ls")
		end,
	},
}
