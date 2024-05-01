return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function () 
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"lua",
				"vim",
				"vimdoc",
				"query",
				"python",
				"json",
				"terraform",
				"yaml",
				"bash",
				"javascript",
				"html"
			},
			sync_install = false,
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },  
		})
	end
}
