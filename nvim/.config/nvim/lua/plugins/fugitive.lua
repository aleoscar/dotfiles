return {
    "tpope/vim-fugitive",
    config = function()
        vim.keymap.set('n', '<leader>gi', function ()
            vim.cmd('vert G')
            vim.cmd('vert resize 60')
        end)
    end
}
