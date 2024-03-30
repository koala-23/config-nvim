return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    keys = {
        {
            "<leader>ff",
            function()
                local opt = { show_untracked = true }
                local ok = pcall(require("telescope.builtin").git_files, opt)
                if not ok then
                    require("telescope.builtin").find_files(opt)
                end
            end,
        },
        {
            "<leader>fa", function()
            require('telescope.builtin')
                .help_tags()
        end
        },
        {
            "<leader>fw", function()
            local word = vim.fn.expand("<cword>")
            require("telescope.builtin").grep_string({ search = word })
        end
        },
        { "<leader>fk", "<cmd>Telescope keymaps<cr>" },
        { "<leader>fb", "<cmd>Telescope buffers initial_mode=normal<cr>" },
        { "<leader>gs", "<cmd>Telescope git_status initial_mode=normal<cr>" },
    },
    config = function()
        require('telescope').setup {
            defaults = {
                initial_mode = "insert",
                file_ignore_patterns = { "%.zip", "%.class", "lazy-lock.json", "node_modules/", "live-server/", "vendor/" },
                prompt_prefix = "  ",
                selection_caret = "󱞩 ",
                winblend = 0,
                layout_strategy = "vertical",
                layout_config = {
                    width = 0.6,
                    height = 0.85,
                    preview_cutoff = 1,
                    mirror = true,
                    prompt_position = "top",
                },
                selection_strategy = "reset",
                sorting_strategy = "ascending",
                scroll_strategy = "limit",
                color_devicons = true,
                mappings = {
                    n = {
                        ["<C-c>"] = "close",
                        ["<C-h>"] = "which_key",
                    },
                    i = {
                        ["<C-c>"] = "close",
                        ["<C-q>"] = "close",
                    },
                },
                file_previewer = require("telescope.previewers").vim_buffer_cat.new,
                grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
                qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
                history = {
                    path = "~/.local/share/nvim/databases/telescope_history.sqlite3",
                    limit = 100,
                },
            },
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown {}
                },
            },
        }
    end
}
