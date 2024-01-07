return {
    -- themes
    { 'ryanoasis/vim-devicons' },
    {
        'tanvirtin/monokai.nvim',
        config = function()
            require('monokai').setup()
        end
    },

    -- UI
    {
        'rcarriga/nvim-notify',
        dependencies = { 'tanvirtin/monokai.nvim' },
        config = function()
            vim.notify = require('notify')
        end
    },
    { 'preservim/tagbar' },
    {
        -- start screen
        'goolord/alpha-nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            'tanvirtin/monokai.nvim',
        },
        config = function()
            require('alpha').setup(require('alpha.themes.startify').config)
        end
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        dependencies = { 'tanvirtin/monokai.nvim' },
        config = function()
            local highlight = {
                "IblCustomIndent",
            }
            local hooks = require("ibl.hooks")
            hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
                vim.api.nvim_set_hl(0, "IblCustomIndent", { fg = "#333842" })
            end)
            require('ibl').setup({
                indent = {
                    char = '▏',
                    highlight = highlight,
                },
            })
        end
    },
    { 'lukas-reineke/virt-column.nvim', dependencies = { 'tanvirtin/monokai.nvim' } },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            'tanvirtin/monokai.nvim',
        },
        config = function()
            require('lualine').setup()
        end
    },
    { 'ntpeters/vim-better-whitespace' },
    { 'famiu/bufdelete.nvim' },

    -- Features
    {
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
        },
        lazy = false,
    },
    { 'embear/vim-localvimrc' },
    { 'tpope/vim-fugitive',     version = '*' },
    { 'mg979/vim-visual-multi', branch = 'master' },
    {
        -- send code to interactive interpretator
        'jpalardy/vim-slime',
        config = function()
            vim.g.slime_target = 'kitty'
        end
    },
    { 'voldikss/vim-floaterm' }, -- open terminal in popup window

    -- Syntax support
    {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            vim.cmd [[TSUpdate]]
            require('nvim-treesitter.configs').setup {
                ensure_installed = {
                    "go",
                    "python",
                    "lua",
                    "vim",
                    "vimdoc",
                    "query",
                    "bash",
                    "csv",
                    "diff",
                    "dockerfile",
                    "gitignore",
                    "gomod",
                    "html",
                    "javascript",
                    "json",
                    "make",
                    "markdown",
                    "regex",
                    "toml",
                    "typescript",
                    "xml",
                    "yaml",
                },
            }
        end
    },

    -- Formatters

    -- Auto complete
    { 'github/copilot.vim' },

    -- Utils
    {
        'dstein64/vim-startuptime',
        init = function()
            vim.g.startuptime_tries = 5
            vim.g.startuptime_event_width = 50
        end,
        cmd = 'StartupTime',
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },
}
