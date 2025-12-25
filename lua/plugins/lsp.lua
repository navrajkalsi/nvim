-- Change table here to 'ensure_installed' & 'vim.lsp.config(server)' & 'vim.lsp.enable(server)'
local servers = { "lua_ls", "clangd", "ts_ls", "bashls" }

return {
	"mason-org/mason-lspconfig.nvim",

	opts = {
		ensure_installed = servers,
	},

	dependencies = {
		{ "mason-org/mason.nvim", opts = {} }, -- takes care of mason here

		{
			"neovim/nvim-lspconfig",

			dependencies = { "hrsh7th/cmp-nvim-lsp", opts = {} },

			keys = {
				{
					"K",
					vim.lsp.buf.hover,
					desc = "Displays documentation regarding a function",
				},
				{
					"gr",
					vim.lsp.buf.references,
					desc = "[G]oto [R]eferences of a function",
				},
				{
					"gd",
					vim.lsp.buf.definition,
					desc = "[G]oto [D]efinition of a function",
				},
				{
					"gi",
					vim.lsp.buf.implementation,
					desc = "[G]oto [I]mplementations of a function",
				},
				{
					"<leader>ca",
					vim.lsp.buf.code_action,
					desc = "Displays [C]ode [A]ctions",
				}, -- telescope.ui-select is already loaded
				{
					"<leader>f",
					vim.lsp.buf.format,
					desc = "[F]ormat buffer",
				},
			},

			config = function()
				local capabilities = require("cmp_nvim_lsp").default_capabilities()

				-- Setting default capabilities of all servers
				vim.lsp.config("*", {
					capabilities = capabilities,
				})

				vim.lsp.enable(servers)
			end,
		},
	},
}
