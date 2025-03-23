vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", ":Telescope file_browser path=%:p:h select_buffer=false<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>")

-- Copying & pasting
vim.keymap.set({ "n", "v" }, "<leader>y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>p", [["+P]])

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader><leader>", ":so<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<C-w>w", ":vsplit<CR>", { silent = true, noremap = true })

--Lspsaga
vim.keymap.set("n", "1", ":Lspsaga code_action<CR>", { silent = true, noremap = true })

vim.keymap.set("n", "<C-s>", ":w<CR>")

-- Terminal
vim.keymap.set("n", "<leader>tt", ":term<CR>i", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>twd", ":term<CR>icd " .. vim.fn.expand('%:p:h') .. " <CR>clear<CR>",
    { silent = true, noremap = true })
