return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    no_italic = true,
    config = function()
        local config = require("catppuccin")
        config.setup({
            no_italic = true,
            transparent_background = true,
        })
        vim.cmd.colorscheme "catppuccin"
    end
}
