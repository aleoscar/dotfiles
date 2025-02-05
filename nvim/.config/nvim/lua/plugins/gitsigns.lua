return {
    "lewis6991/gitsigns.nvim",
    config = function ()
        require('gitsigns').setup{
            on_attach = function()
                local gitsigns = require('gitsigns')
                vim.keymap.set('n', '<leader>hs', gitsigns.stage_hunk, {desc = "stage hunk"})
                vim.keymap.set('n', '<leader>hr', gitsigns.reset_hunk, {desc = "reset hunk"})
                vim.keymap.set('n', '<leader>hn', function() gitsigns.nav_hunk('next', {}) end, {desc = "goto next hunk"})
            end
        }
    end
}
