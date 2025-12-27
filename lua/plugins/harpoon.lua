return {
	"ThePrimeagen/harpoon",

	branch = "harpoon2",

	dependencies = { "nvim-lua/plenary.nvim" },

	opts = {},

	keys = {
		{
			"<leader>a",
			function()
				require("harpoon"):list():add()
			end,
			desc = "[A]dd file to harpoon",
		},
		{
			"<leader>h",
			function()
				require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
			end,
			desc = "Toggle [H]arpoon menu",
		},
		{
			"<leader>q",
			function()
				require("harpoon"):list():select(1)
			end,
			desc = "Select first file",
		},
		{
			"<leader>w",
			function()
				require("harpoon"):list():select(2)
			end,
			desc = "Select second file",
		},

		{
			"<leader>e",
			function()
				require("harpoon"):list():select(3)
			end,
			desc = "Select third file",
		},
		{
			"<leader>r",
			function()
				require("harpoon"):list():select(4)
			end,
			desc = "Select fourth file",
		},
	},
}
