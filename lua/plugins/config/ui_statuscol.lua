local M = {}

M.config = function()
    local builtin = require('statuscol.builtin')
    local cfg = {
        relculright = true,
        segments = {
            { text = { builtin.foldfunc }, click = 'v:lua.ScFa' },
            {
                sign = { name = { 'Diagnostic' }, maxwidth = 2, auto = true },
                click = 'v:lua.ScSa'

            },
            { text = { builtin.lnumfunc }, click = 'v:lua.ScLa' },
            {
                sign = { name = { '.*' }, maxwidth = 1, colwidth = 2, auto = false, wrap = false },
                click = 'v:lua.ScSa'
            },
        }
    }
    require('statuscol').setup(cfg)
end

return M
