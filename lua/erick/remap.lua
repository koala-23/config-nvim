vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("n", "<leader>fp", "<cmd>Explore ~/.config/nvim-3/lua/erick<cr>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<C-c>", "<silent><C-c>")

vim.keymap.set("n", "space", "<nop>")
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "q", "<nop>")
vim.keymap.set("n", "J", "<nop>")
vim.keymap.set("n", "L", "<nop>")
vim.keymap.set("n", "H", "<nop>")
vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- terminal
vim.keymap.set("n", "<leader>tt", "<cmd>split | resize 15 | term<cr>")
-- salir del modo terminal
vim.keymap.set("t", "<C-c>c", "<C-\\><C-n>", { noremap = true, silent = true })
-- Splits
vim.keymap.set("n", "<leader>qq", ":bd!<CR>", { noremap = true, silent = true, desc = "Splits quit" })
vim.keymap.set("n", "<C-q>", ":bd<CR>", { noremap = true, silent = true, desc = "Splits quit" })
vim.keymap.set("n", "<A-v>", ":vnew +set\\ buftype=nofile<CR>",
    { noremap = true, silent = true, desc = "Splits vertical" })
vim.keymap.set("n", "<A-s>", ":new +set\\ buftype=nofile<CR>",
    { noremap = true, silent = true, desc = "Splits horizontal" })

-- windows
vim.keymap.set("n", "<C-t>", ":tabnew<CR>", { noremap = true, silent = true, desc = "tabnew" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true, desc = "Change window left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true, desc = "Change window down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true, desc = "Change window up" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true, desc = "Change window right" })
vim.keymap.set("n", "<C-w>h", "<C-w>H", { noremap = true, silent = true, desc = "split move left" })
vim.keymap.set("n", "<C-w>j", "<C-w>J", { noremap = true, silent = true, desc = "split move down" })
vim.keymap.set("n", "<C-w>k", "<C-w>K", { noremap = true, silent = true, desc = "split move up" })
vim.keymap.set("n", "<C-w>l", "<C-w>L", { noremap = true, silent = true, desc = "split move right" })

-- indentar codigo
vim.keymap.set({ "n", "v" }, '<A-F>', 'mm=G`m', { noremap = true, silent = true, desc = "Indent code without plugin" })

vim.keymap.set("n", "<C-u>", "6k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-d>", "6j", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>L", "<cmd>Lazy<cr>", { noremap = true, silent = true, desc = "Indent code without plugin" })

vim.keymap.set("n", "<leader>rr", function()
    local buf = vim.api.nvim_get_current_buf()
    local clients = vim.lsp.get_active_clients({ bufnr = buf })
    if not vim.tbl_isempty(clients) then
        vim.cmd("LspStop")
        vim.notify("LspStop")
    else
        vim.cmd("LspStart")
        vim.notify("LspStart")
    end
end
)
