return {
    "echasnovski/mini.indentscope",
    version = false,
    config = function()
        require("mini.indentscope").setup({
            symbol = '│',
            use_tree_sitter = true
        })
    end,
}
