vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.showmode = false

vim.opt.fillchars = {
	eob = " ",
}
vim.opt.listchars = {
	tab = "→ ",
	-- tab = "··",
	lead = "·",
	trail = "·",
	nbsp = "␣",
}

vim.opt.breakindent = true

vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Always show a sign column. This prevents text from shifting when signs appear or disappear.
vim.opt.signcolumn = "yes"

vim.opt.splitright = true
vim.opt.splitbelow = true

-- Show invisible chars
vim.opt.list = true

vim.opt.cursorline = true

vim.opt.scrolloff = 10

vim.opt.confirm = true

-- All windows are of equal size
vim.opt.equalalways = true

vim.opt.cmdheight = 0

vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.smoothscroll = true
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.textwidth = 100

vim.opt.hlsearch = false
vim.opt.termguicolors = true

vim.opt.updatetime = 50

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
		vim.cmd([[%s/\s\+$//e]])
		vim.lsp.buf.format({ async = false })
	end,
})
