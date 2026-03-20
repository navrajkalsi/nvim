local parsers = { "bash", "c", "lua", "markdown", "javascript", "python", "rust" }

return {
	"nvim-treesitter/nvim-treesitter",

	build = ":TSUpdate",

	branch = "main",

	lazy = false,

	opts = {
		install_dir = vim.fn.stdpath("data") .. "/site",
		auto_install = true,
		highlight = {
			enable = true,
		},
	},

	config = function()
		require("nvim-treesitter").install(parsers)
	end,
}
