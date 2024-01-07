return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
            "3rd/image.nvim",
            {
                's1n7ax/nvim-window-picker',
                name = 'window-picker',
                event = 'VeryLazy',
                version = '2.*',
                config = function()
                    require('window-picker').setup()
                end,
            },
            'tanvirtin/monokai.nvim',
        },
        config = function()
            vim.fn.sign_define("DiagnosticSignError",
                { text = " ", texthl = "DiagnosticSignError" })
            vim.fn.sign_define("DiagnosticSignWarn",
                { text = " ", texthl = "DiagnosticSignWarn" })
            vim.fn.sign_define("DiagnosticSignInfo",
                { text = " ", texthl = "DiagnosticSignInfo" })
            vim.fn.sign_define("DiagnosticSignHint",
                { text = "󰌵", texthl = "DiagnosticSignHint" })
            local cfg = {
                popup_border_style = 'single',
                enable_git_status = true,
                enable_diagnostics = true,
                sync_root_with_cwd = true,
                respect_buf_cwd = true,
                window = {
                    mappings = {
                        ["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = true } },
                        ['x'] = 'close_node',
                        ['o'] = 'open',
                        ['t'] = 'open',
                        ['z'] = '',
                    },
                },
                filesystem = {
                    follow_current_file = {
                        enabled = true,
                        leave_dirs_open = false,
                    },
                    filtered_items = {
                        hide_by_name = {
                            "venv"
                        },
                        always_show = { -- remains visible even if other settings would normally hide it
                            ".gitlab-ci.yml",
                        },
                    },
                },
                buffers = {
                    follow_current_file = {
                        enabled = true,
                        leave_dirs_open = false,
                    },
                },
                use_libuv_file_watcher = true,
                event_handlers = {
                    {
                        event = "vim_buffer_enter",
                        handler = function()
                            if vim.bo.filetype == "neo-tree" then
                                vim.cmd([[setlocal signcolumn=no]])
                            end
                        end,
                    },
                },
            }
            require("neo-tree").setup(cfg)

            vim.api.nvim_create_autocmd("VimEnter", {
                callback = function()
                    require("user.utils").toggle_neotree("source=filesystem")
                end,
            })
        end
    }
}
