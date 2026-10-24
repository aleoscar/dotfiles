return {
	"akinsho/git-conflict.nvim",
	version = "*",
	config = function()
		require("git-conflict").setup({
			default_mappings = true, -- Use default buffer-local mappings
			default_commands = true, -- Create default commands
			disable_diagnostics = false, -- Disable diagnostics in conflicted buffers
			list_opener = "copen", -- Command to open conflicts list
			highlights = { -- Highlight groups for different sections
				incoming = "DiffAdd",
				current = "DiffText",
			},
		})
	end,
}
