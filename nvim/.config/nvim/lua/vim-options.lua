vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set splitright")
vim.opt.number = true
vim.opt.relativenumber = true

vim.g.mapleader=" "

vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', {})
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', {})
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', {})
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', {})
vim.keymap.set('n', '<leader>o', 'o<ESC>', {})
vim.keymap.set('n', '<C-->', ':resize -1<CR>', {})
vim.keymap.set('n', '<C-+>', ':resize +1<CR>', {})
vim.keymap.set('n', '<leader>hi', ':noh<CR>', {})
vim.keymap.set('n', '<leader>yf', 'ggVG\"+y<C-o>', {})
vim.keymap.set('n', '<leader>vn', ':vert new<CR>', {})

vim.diagnostic.config({ signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '',
            [vim.diagnostic.severity.WARN] = '',
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
            [vim.diagnostic.severity.WARN] = 'WarningMsg',
        },
    },
})
