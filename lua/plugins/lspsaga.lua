return {
	"nvimdev/lspsaga.nvim",

	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},

	opts = {},

	keys = {
		{
			"<leader>pd",
			":Lspsaga peek_definition<CR>",
			desc = "[P]eek [D]efinition",
		},
	},
}
