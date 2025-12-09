-- Hint: use `:h <option>` to figure out the meaning if needed
vim.opt.clipboard = "unnamedplus" -- use system clipboard
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.mouse = "a" -- allow the mouse to be used in Nvim

-- Tab
vim.opt.tabstop = 4 -- number of visual spaces per TAB
vim.opt.softtabstop = 4 -- number of spacesin tab when editing
-- vim.opt.shiftwidth = 2 -- insert 4 spaces on a tab
vim.opt.expandtab = true -- tabs are spaces, mainly because of python

-- UI config
-- 显示行号
vim.opt.number = true -- show absolute number
-- 使用相对行号
-- vim.opt.relativenumber = true -- add numbers to each line on the left side
-- 高亮当前行
vim.opt.cursorline = true -- highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true -- open new vertical split bottom
vim.opt.splitright = true -- open new horizontal splits right
-- vim.opt.termguicolors = true				-- enabl 24-bit RGB color in the TUI
vim.opt.showmode = false -- we are experienced, wo don't need the "-- INSERT --" mode hint
vim.opt.foldenable = false -- disable folding completely

-- Searching
vim.opt.incsearch = true -- search as characters are entered
vim.opt.hlsearch = true -- do not highlight matches
vim.opt.ignorecase = true -- ignore case in searches by default
vim.opt.smartcase = true -- but make it case sensitive if an uppercase is entered

-- For nvim-tree
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- 启用增强模式的命令行补全
-- set wildmenu
-- 显示可能匹配的文件列表，并使用第一个匹配项进行补全 --C-d: possible completions, C-n|p cycle results
-- set wildmode=list:full
-- 忽略指定类型的文件
-- set wildignore=*.dll,*.exe,*.jpg,*.gif,*.png
-- 指定前缀的文件则会获得较低的优先级
-- set suffixes=.bak,~,.o,.h,.info,.swp,.obj
-- 设置命令行自动补全的触发键。默认为Tab键
-- set wildchar=<F12>

-- hidden virtual text
vim.diagnostic.config({
	virtual_text = false,
})

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, border= "rounded"})]])
