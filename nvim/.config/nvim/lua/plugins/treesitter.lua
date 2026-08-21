 -- return {
 --    "nvim-treesitter/nvim-treesitter",
 --    build = ":TSUpdate",
 --    config = function()
 --        local config = require("nvim-treesitter.configs")
 --        config.setup({
 --            ensure_installed = {"lua", "rust", "java"},
 --            highlight = {enable = true},
 --            indent = { enable = true},
 --        })
 --    end
-- }

return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    config = function()
        local ts = require("nvim-treesitter")
        ts.setup()
        ts.install({ "lua", "rust", "java", "c", "cpp" })

        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "lua", "rust", "java", "c", "cpp" },
            callback = function()
                vim.treesitter.start()
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end,
}
