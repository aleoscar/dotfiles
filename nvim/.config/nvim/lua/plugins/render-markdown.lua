return {
    'MeanderingProgrammer/render-markdown.nvim',
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
    ft = { 'markdown'},
    config = function ()
        require('render-markdown').setup({
            render_modes = {'n', 'c'},
            anti_conceal = { enabled = false },
        })
    end,
    enabled = false
}
