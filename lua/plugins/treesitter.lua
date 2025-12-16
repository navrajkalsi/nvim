return {
	"nvim-treesitter/nvim-treesitter",

	build = ":TSUpdate",

	branch = "main",

	opts = {
		ensure_installed = { "bash", "c", "lua", "markdown", "javascript", "python" },
		sync_install = false,
		auto_install = true,
		highlight = {
			enable = true,
			-- large file safe guard
			disable = function(lang, buf)
				local max_filesize = 100 * 1024 -- 100 KB
				local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
				if ok and stats and stats.size > max_filesize then
					return true
				end
			end,
			additional_vim_regex_highlighting = false,
		},
	},
}
