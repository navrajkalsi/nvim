return {
	"nvimtools/none-ls.nvim",

	event = "VeryLazy",

	dependencies = { "nvim-lua/plenary.nvim" },

	opts = function()
		local null_ls = require("null-ls")

		return {
			sources = { -- to be installed via mason
				-- C / C++
				null_ls.builtins.formatting.clang_format,

				-- Lua
				null_ls.builtins.formatting.stylua,

				-- Python
				null_ls.builtins.formatting.black,

				-- JS / TS
				null_ls.builtins.formatting.prettier,
			},
		}
	end,
}
