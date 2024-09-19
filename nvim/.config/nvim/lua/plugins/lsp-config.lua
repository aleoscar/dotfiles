return {
    -- Mason config
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },

    -- mason lspconfig
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "jdtls", "rust_analyzer", "jedi_language_server", "clangd"}
            })
        end
    },

    -- nvim lspconfig
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            local lspconfig = require("lspconfig")
            -- global keybinds
            vim.keymap.set('n', '<leader>ho', vim.lsp.buf.hover, {})
            vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, {})
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
            vim.keymap.set('n', '<leader>re', vim.lsp.buf.rename, {})
            vim.keymap.set('n', '<leader>ge', vim.diagnostic.goto_next, {})

            -- lua setup 
            lspconfig.lua_ls.setup({
                capabilities = capabilities
            })

            -- java setup
            lspconfig.jdtls.setup({
                capabilities = capabilities
            })

            -- rust setup
            lspconfig.rust_analyzer.setup({
                capabilities = capabilities

            })

            lspconfig.jedi_language_server.setup({
                capabilities = capabilities
            })

            lspconfig.clangd.setup({
                capabilities = capabilities
            })

        end
    }

}
