-- File managing binds
vim.keymap.set("n", "<leader>fx", vim.cmd.Ex, {desc = "Open Net-rw explorer"})
vim.keymap.set('n', '\\', '<Cmd>Neotree toggle<CR>', {desc = "Toggle Neotree"})

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>t', "<Cmd>Telescope<CR>", {desc = "Open Telescope"})
vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = "Find files"})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {desc = "Live grep"})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc = "Find buffers"})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc= "Get Help tags"})
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {desc = "Find old files"})

-- Trouble
vim.keymap.set("n", "<leader>ad", function() require("trouble").toggle() end, {desc = "Open Trouble.nvim"})
