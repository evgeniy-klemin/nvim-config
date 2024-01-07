return {
    {
        'akinsho/bufferline.nvim',
        version = '*',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            'tanvirtin/monokai.nvim',
        },
        config = function()
            vim.opt.termguicolors = true
            local cfg = {
                options = {
                    close_command = require('bufdelete').bufdelete,
                    hover = {
                        enabled = true,
                        delay = 200,
                        reveal = { 'close' },
                    },
                    diagnostics = 'coc',
                    offsets = {
                        {
                            filetype = 'neo-tree',
                            text = 'File Explorer',
                            highlight = 'Directory',
                            text_align = 'center',
                            separator = true,
                        },
                    },
                },
            }
            require('bufferline').setup(cfg)
        end
    },
}
