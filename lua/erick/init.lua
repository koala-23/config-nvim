require("erick.set")
require("erick.remap")
require("erick.custom")
require("erick.lazy_init")

local groupErick = vim.api.nvim_create_augroup('GroupErick', { clear = true })
local autocmd = vim.api.nvim_create_autocmd

function R(name)
    require("plenary.reload").reload_module(name)
end

vim.api.nvim_set_hl(0, "customColor", { bg = "#ff966c", fg = "#1b1d2b" })
autocmd("TextYankPost", {
    group = groupErick,
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = "customColor",
            timeout = 40,
        })
    end
})


autocmd('LspAttach', {
    group = groupErick,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references initial_mode=normal<cr>", opts)
        vim.keymap.set("n", "<A-f>", function() vim.lsp.buf.format() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>vc", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
    end
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 50
