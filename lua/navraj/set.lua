vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
--vim.opt.undodir = os.getenv("HOME") .."/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

-- vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.colorcolumn = "100"

vim.o.scrolloff = 25

vim.opt.list = true

vim.opt.listchars = {
    lead = "·",
    trail = "·",
    nbsp = "␣"
}

-- Executes when a buffer is request to be saved to the disk
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        vim.cmd([[%s/\s\+$//e]])
        vim.lsp.buf.format({ async = false })
    end,
})

-- Telescope File Browser
vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "#252526" })                    -- VS Code dark background
vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#007ACC" })                    -- VS Code blue border
vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "#1E1E1E" })              -- Dark prompt area
vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "#373737", fg = "#FFFFFF" }) -- Selected item
