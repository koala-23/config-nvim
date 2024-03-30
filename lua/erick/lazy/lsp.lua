return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        { "williamboman/mason.nvim", opts = { ui = { width = 0.6, height = 0.6 } } },
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        require("mason").setup({ ui = { border = "rounded" } })

        local lspconfig = require("lspconfig")

        lspconfig.gopls.setup {
            capabilities = capabilities,
            cmd = { "/home/usuario/.local/share/nvim-2/mason/bin/gopls" }
        }

        lspconfig.clangd.setup {
            capabilities = capabilities,
            cmd = { "/home/usuario/.local/share/nvim-2/mason/bin/clangd" }
        }

        lspconfig.jsonls.setup {
            capabilities = capabilities,
            cmd = { "/home/usuario/.local/share/nvim-2/mason/bin/vscode-json-language-server", "--stdio" }
        }

        lspconfig.astro.setup {
            capabilities = capabilities,
            cmd = { "/home/usuario/.local/share/nvim-2/mason/bin/astro-ls", "--stdio" }
        }

        lspconfig.emmet_ls.setup {
            capabilities = capabilities,
            cmd = { "/home/usuario/.local/share/nvim-2/mason/bin/emmet-ls", "--stdio" }
        }

        lspconfig.tailwindcss.setup {
            capabilities = capabilities,
            autostart = false,
            cmd = { "/home/usuario/.local/share/nvim-2/mason/bin/tailwindcss-language-server", "--stdio" }
        }

        lspconfig.volar.setup {
            capabilities = capabilities,
            cmd = { "/home/usuario/.local/share/nvim-2/mason/bin/vue-language-server", "--stdio" },
            init_options = {
                typescript = {
                    tsdk = "/home/usuario/.local/share/nvim-2/mason/packages/vue-language-server/node_modules/typescript/lib",
                }
            }
        }

        lspconfig.lemminx.setup {
            capabilities = capabilities,
            cmd = { "/home/usuario/.local/share/nvim-2/mason/bin/lemminx" }
        }

        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "tsserver",
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,

                ["lua_ls"] = function()
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim", "it", "describe", "before_each", "after_each" },
                                }
                            }
                        }
                    }
                end,
            }
        })
    end
}
