return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        options = {
            globalstatus = true,
        },
        extensions = { "fugitive" },
        sections = {
            lualine_a = { { "mode", upper = true } },
            lualine_b = { { "branch", icon = "" }, "db_ui#statusline" },
            lualine_c = { { "filename", file_status = false, path = 0 } },
            lualine_x = {
                {
                    "diagnostics",
                    symbols = {
                        error = " ", warn = " ", hint = "󰠠 ", info = " "
                    }
                },
                {
                    "diff",
                    symbols = {
                        added = " ", modified = " ", removed = " ",
                    }
                },
            },
            lualine_y = { "filetype", "progress" },
            lualine_z = { "location" },
        },
        inactive_winbar = {
            lualine_c = { { "filetype", icon_only = true }, { "filename", color = { bg = "none", fg="#b6b6b6" } } },
        },
    },
}
