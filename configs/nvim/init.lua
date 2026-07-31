vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('config.options')     -- ported :set options from ~/.vimrc
require('config.lazy')        -- bootstrap lazy.nvim, import lua/plugins/*
require('config.keymaps')     -- the Space layer + clipboard/window/comment maps
require('config.diagnostics') -- diagnostics presentation (virtual_text/signs/float)

pcall(vim.cmd.colorscheme, 'challenger_deep')
