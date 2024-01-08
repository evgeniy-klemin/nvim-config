return {
    ---------------------------------------------------------------------------
    -- Themes {{{
    ---------------------------------------------------------------------------
    { 'ryanoasis/vim-devicons' },
    {
        'tanvirtin/monokai.nvim',
        config = function() require('monokai').setup() end
    },
    -- }}}
    ---------------------------------------------------------------------------


    ---------------------------------------------------------------------------
    -- UI {{{
    ---------------------------------------------------------------------------
    {
        'rcarriga/nvim-notify',
        dependencies = { 'tanvirtin/monokai.nvim' },
        config = require('plugins.config.ui_notify').config,
    },
    { 'preservim/tagbar' },
    {
        -- start screen
        'goolord/alpha-nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            'tanvirtin/monokai.nvim',
        },
        config = require('plugins.config.ui_alpha').config,
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        dependencies = { 'tanvirtin/monokai.nvim' },
        config = require('plugins.config.ui_blankline').config,
    },
    { 'lukas-reineke/virt-column.nvim', dependencies = { 'tanvirtin/monokai.nvim' } },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            'tanvirtin/monokai.nvim',
        },
        config = function() require('lualine').setup() end
    },
    { 'ntpeters/vim-better-whitespace' },
    { 'famiu/bufdelete.nvim' },
    {
        'akinsho/bufferline.nvim',
        version = '*',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            'tanvirtin/monokai.nvim',
        },
        config = require('plugins.config.ui_bufferline').config,
    },
    {
        's1n7ax/nvim-window-picker',
        name = 'window-picker',
        event = 'VeryLazy',
        version = '2.*',
        config = function() require('window-picker').setup() end,
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "main",
        init = function() vim.g.neo_tree_remove_legacy_commands = true end,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
            "3rd/image.nvim",
            's1n7ax/nvim-window-picker',
            'tanvirtin/monokai.nvim',
        },
        config = require("plugins.config.ui_neotree").config,
    },
    {
        'luukvbaal/statuscol.nvim',
        dependencies = { 'tanvirtin/monokai.nvim' },
        config = require('plugins.config.ui_statuscol').config,
    },
    {
        "kevinhwang91/nvim-ufo",
        dependencies = { "kevinhwang91/promise-async" },
        config = require("plugins.config.ui_ufo").config,
    },
    -- }}}
    ---------------------------------------------------------------------------


    ---------------------------------------------------------------------------
    -- Features {{{
    ---------------------------------------------------------------------------
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
        config = require('plugins.config.feat_slime').config,
    },
    { 'voldikss/vim-floaterm' }, -- open terminal in popup window
    {
        "mrjones2014/smart-splits.nvim",
        lazy = true,
        opts = { ignored_filetypes = { "nofile", "quickfix", "qf", "prompt" }, ignored_buftypes = { "nofile" } },
    },
    -- }}}
    ---------------------------------------------------------------------------


    ---------------------------------------------------------------------------
    -- Syntax support {{{
    ---------------------------------------------------------------------------
    {
        'nvim-treesitter/nvim-treesitter',
        config = require('plugins.config.syntax_treesitter').config,
    },
    -- }}}
    ---------------------------------------------------------------------------


    ---------------------------------------------------------------------------
    -- LSP {{{
    ---------------------------------------------------------------------------
    {
        'neoclide/coc.nvim',
        branch = 'release',
        config = require('plugins.config.lsp_coc').config,
    },
    -- }}}
    ---------------------------------------------------------------------------


    ---------------------------------------------------------------------------
    -- Autocomplete {{{
    ---------------------------------------------------------------------------
    { 'github/copilot.vim' },
    -- }}}
    ---------------------------------------------------------------------------


    ---------------------------------------------------------------------------
    -- Utils {{{
    ---------------------------------------------------------------------------
    {
        'dstein64/vim-startuptime',
        init = require('plugins.config.utils_startuptime').init,
        cmd = 'StartupTime',
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {}
    },
    {
        'mikesmithgh/kitty-scrollback.nvim',
        enabled = true,
        lazy = true,
        cmd = { 'KittyScrollbackGenerateKittens', 'KittyScrollbackCheckHealth' },
        event = { 'User KittyScrollbackLaunch' },
        version = '*', -- latest stable version, may have breaking changes if major version changed
        config = function() require('kitty-scrollback').setup() end,
    },
    { "junegunn/fzf", build = "./install --bin" },
    {
        "ibhagwan/fzf-lua",
        dependencies = { "nvim-tree/nvim-web-devicons", "junegunn/fzf" },
        config = function() require("fzf-lua").setup() end
    },
    -- }}}
    ---------------------------------------------------------------------------
}
