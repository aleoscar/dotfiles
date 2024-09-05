return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal toggle right<CR>", {})

        require("neo-tree").setup({
            close_if_last_window = true,
            window = {
                width = 35,
            },
            default_component_configs = {
                git_status = {
                    symbols = {
                        added     = "✚", -- set to an empty string to not show them
                        deleted   = "✖",
                        modified  = "󰏫",
                        renamed   = "󰁕",

                        untracked = "",
                        ignored   = "󰈉",
                        unstaged  = "󰄱",
                        staged    = "",
                        conflict  = "",
                    }
                },
            }
        })
    end,
}
