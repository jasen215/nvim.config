# My Nvim Configure

Config files for nvim.

## Feature

The following assume your [leader key] is set to `,`.

You can change your leader key using the following setting in your `~/.config/nvim/lua/keymaps.lua`:

`let mapleader=','`

* `,d` brings up [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua), a sidebar buffer for navigating and manipulating files
* `,t` brings up [split-term.vim](https://github.com/vimlab/split-term.vim)
* `,ff` telescope.builtin.find_files
* `,fg` telescope.builtin.live_grep
* `,fb` telescope.builtin.buffers
* `,fn` telescope.builtin.help_tags
* `,r` telescope.builtin.treesitter
* `gcc` toggles current line comment
* `gc` toggles visual selection comment lines
* `<C-hjkl>` move between windows, shorthand for `<C-w> hjkl`

## Install

```
git clone https://github.com/jasen215/config.nvim.git ~/.confie/nvim
```

## Manual Setup Steps

Due to a name-mapping issue in `mason-lspconfig.nvim` (as of `mason.nvim v2.1.0`), some language servers need to be installed manually after the initial setup. This issue may be resolved in future updates to the plugins.

After cloning the configuration, run the following commands within Neovim to ensure all language servers are installed correctly:

```
:MasonInstall vue-language-server
:MasonInstall typescript-language-server
```