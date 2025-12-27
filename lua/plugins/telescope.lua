return {
	"nvim-telescope/telescope.nvim",

	event = "VimEnter",

	name = "telescope", -- internal id for this plugin

	main = "telescope", -- what module to require for setup

	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-telescope/telescope-file-browser.nvim", -- file browser in here
		{
			"nvim-tree/nvim-web-devicons",
			enabled = vim.g.have_nerd_font,
		},
	},

	keys = {
		{
			"<leader>sf",
			function()
				require("telescope.builtin").find_files({ hidden = true })
			end,
			desc = "[S]earch [F]iles",
		},
		{
			"<leader>sg",
			function()
				require("telescope.builtin").live_grep({ additional_args = { "--hidden" } })
			end,
			desc = "[S]earch by [G]rep",
		},
		{
			"<leader>sb",
			function()
				require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 0,
					previewer = false,
				}))
			end,
			desc = "[S]earch current [B]uffer",
		},
		{
			"<leader>sd",
			function()
				require("telescope.builtin").diagnostics()
			end,
			desc = "[S]earch [D]iagnostics",
		},
		{
			"<leader>sr",
			function()
				require("telescope.builtin").resume()
			end,
			desc = "[S]earch [R]esume",
		},
		{
			"<leader>s.",
			function()
				require("telescope.builtin").oldfiles()
			end,
			desc = "[S]earch Recent Files",
		},
		{
			"<leader>sh",
			function()
				require("telescope.builtin").help_tags()
			end,
			desc = "[S]earch [H]elp",
		},
		{
			"<leader>so",
			function()
				require("telescope.builtin").live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files",
					additional_args = {
						"--hidden",
					},
				})
			end,
			desc = "[S]earch [O]pen Files",
		},
		{
			"<leader>sn",
			function()
				require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config"), hidden = true })
			end,
			desc = "[S]earch [N]eovim files",
		},
		{
			"<leader>fe",
			function()
				require("telescope").extensions.file_browser.file_browser({
					path = "%:p:h",
					hidden = true,
					select_buffer = true,
					respect_gitignore = false,
				})
			end,
			desc = "Show [F]ile [E]plorer for current file directory",
		},
		{
			"<leader>f.",
			function()
				require("telescope").extensions.file_browser.file_browser({
					hidden = true,
					respect_gitignore = false,
				})
			end,
			desc = "Show [F]ile Eplorer for /[.](current working directory)",
		},
	},

	opts = function()
		local themes = require("telescope.themes")
		return {
			defaults = {
				layout_config = { width = 0.8, height = 0.7, preview_cutoff = 20 },
				borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
			},
			extensions = {
				["ui-select"] = themes.get_dropdown(),
				file_browser = {
					hijack_netrw = true,
					mappings = { i = {}, n = {} },
				},
			},
			pickers = {
				find_files = {
					hidden = true,
				},
				live_grep = {
					additional_args = { "--hidden" },
				},
			},
		}
	end,

	config = function(_, opts)
		local telescope = require("telescope")
		telescope.setup(opts)
		for _, ext in ipairs({ "fzf", "ui-select", "file_browser" }) do
			pcall(telescope.load_extension, ext)
		end

		-- show file browser if started in a dir
		vim.api.nvim_create_autocmd("UiEnter", {
			once = true,
			callback = function(data)
				local directory = vim.fn.isdirectory(data.file) == 1
				if data.file == "" or not directory then
					return
				end

				vim.fn.chdir(data.file)

				require("telescope").extensions.file_browser.file_browser({
					cwd = data.file,
					respect_gitignore = false,
					hidden = true,
					grouped = true,
					initial_mode = "insert",
				})
			end,
		})
	end,
}
