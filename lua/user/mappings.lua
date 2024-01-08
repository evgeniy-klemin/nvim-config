local utils = require("user.utils")

local map = vim.keymap.set
--local e_opts = { expr = true }
local s_opts = function(desc)
    return { silent = true, desc = desc }
end
local se_opts = function(desc)
    return { silent = true, expr = true, desc = desc }
end


-- remap Ex mode to exit
map("n", "Q", "<cmd>q<CR>", s_opts("Exit"))

-- open terminal in popup
map("n", "<Leader><Leader>t", function()
    vim.cmd [[FloatermNew]]
end, s_opts("Open terminal in popup"))

-- enter normal mode in terminal
-- map("t", "<Esc>", "<C-\\><C-n>", s_opts())

-- Toggle fold (single level)
map("n", "<Space><Space>", "foldlevel('.') ? 'za' : '<Space>'", se_opts("Toggle fold"))

-- move line / block
map("n", "<A-j>", ":m .+1<CR>==", s_opts("Move line down"))
map("n", "<A-k>", ":m .-2<CR>==", s_opts("Move line up"))
map("v", "<A-j>", ":m '>+1<CR>gv-gv", s_opts("Move block down"))
map("v", "<A-k>", ":m '<-2<CR>gv-gv", s_opts("Move block up"))

-- Text helpers
-- add a new line before and after the cursor
map("n", "oo", "o<Esc>k", s_opts("Add new line below"))
map("n", "OO", "O<Esc>j", s_opts("Add new line above"))

-- fzf mapping
map("n", "<Leader>ff", "<cmd>FzfLua files<CR>", s_opts("Fuzzy find files"))
map("n", "<Leader>fgf", "<cmd>FzfLua git_files<CR>", s_opts("Fuzzy find git files"))
map("n", "<Leader>fgb", "<cmd>FzfLua git_branches<CR>", s_opts("Fuzzy find git branches"))
map("n", "<Leader>fl", "<cmd>FzfLua live_grep_glob<CR>", s_opts("Fuzzy find in files"))
map("n", "<Leader>fr", "<cmd>FzfLua resume<CR>", s_opts("Fuzzy find resume"))

-- copy word under cursor using buffer 1
map("n", "yw", 'viw"1y', s_opts("Copy word under cursor"))
map("n", "pw", 'viw"1p', s_opts("Paste word under cursor"))

-- Buffer management
map("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", s_opts("Previous buffer"))
map("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", s_opts("Next buffer"))
map("n", "<Leader>w", function()
    require("bufdelete").bufdelete(0, true)
    -- require("bufdelete").bufwipeout(0, true) -- remove from Ctrl-o navigation
end, s_opts("Close buffer"))
map("n", "<Leader>W", "<cmd>BufferLineCloseOthers<CR>", s_opts("Close other buffers"))

-- Neotree
map("n", "<S-f>", function()
    utils.toggle_neotree("source=filesystem toggle=true")
end, s_opts("Toggle Neotree"))
map("n", "f", "<cmd>Neotree reveal_force_cwd<CR>", s_opts("Reveal current file in Neotree"))

-- Format
map("n", "<Leader>fm", "<cmd>Format<CR>", s_opts("Format file"))

-- Tagbar toggle
map("n", "<Leader>tt", "<cmd>TagbarToggle<CR>", s_opts("Toggle Tagbar"))

-- Fold
map('n', 'zR', require('ufo').openAllFolds, s_opts("Open all folds"))
map('n', 'zM', require('ufo').closeAllFolds, s_opts("Close all folds"))
map('n', 'zfm', '<cmd>let &l:foldmethod="marker"<CR>', s_opts("Set foldmethod to marker"))

-- Resizing splits
-- these keymaps will also accept a range,
-- for example `10<S-A-h>` will `resize_left` by `(10 * config.default_amount)`
vim.keymap.set('n', '<S-A-h>', require('smart-splits').resize_left)
vim.keymap.set('n', '<S-A-j>', require('smart-splits').resize_down)
vim.keymap.set('n', '<S-A-k>', require('smart-splits').resize_up)
vim.keymap.set('n', '<S-A-l>', require('smart-splits').resize_right)
-- moving between splits
vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)
-- swapping buffers between windows
vim.keymap.set('n', '<leader><leader>h', require('smart-splits').swap_buf_left)
vim.keymap.set('n', '<leader><leader>j', require('smart-splits').swap_buf_down)
vim.keymap.set('n', '<leader><leader>k', require('smart-splits').swap_buf_up)
vim.keymap.set('n', '<leader><leader>l', require('smart-splits').swap_buf_right)
