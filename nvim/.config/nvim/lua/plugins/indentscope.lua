return {
    "echasnovski/mini.indentscope",
    version = false,
    config = function()
        require("mini.indentscope").setup({
            symbol = "│",
            use_tree_sitter = true,
        })

        vim.api.nvim_create_autocmd("FileType", {
            pattern = {
                "help",
                "neo-tree",
                "Trouble",
                "lazy",
                "mason",
                "text",
            },
            callback = function()
                vim.b.miniindentscope_disable = true
            end,
        })
    end,
}
