-- File managing binds
vim.keymap.set("n", "<leader>fx", vim.cmd.Ex, {desc = "Open Net-rw explorer"})
vim.keymap.set('n', '\\', '<Cmd>Neotree toggle<CR>', {desc = "Toggle Neotree"})

-- Telescope
local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>t', "<Cmd>Telescope<CR>", {desc = "Open Telescope"})
vim.keymap.set('n', '<leader>ff', telescope.find_files, {desc = "Find files"})
vim.keymap.set('n', '<leader>fg', telescope.live_grep, {desc = "Live grep"})
vim.keymap.set('n', '<leader>fb', telescope.buffers, {desc = "Find buffers"})
vim.keymap.set('n', '<leader>fh', telescope.help_tags, {desc= "Get Help tags"})
vim.keymap.set('n', '<leader>fo', telescope.oldfiles, {desc = "Find old files"})

-- Undotree
vim.keymap.set('n', '<leader>u', require('undotree').toggle, { noremap = true, silent = true, desc = "Undotree Toggle" })

-- Trouble
vim.keymap.set("n", "<leader>ad", "<cmd>Trouble diagnostics toggle<cr>", {desc = "Open Trouble.nvim"})

--Terminal
vim.keymap.set('n', "<C-\\>", "<Cmd>terminal<CR>", {desc = "Open Terminal"})
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], {desc = "Normal mode in Terminal"})

--Tab visual selection
vim.keymap.set('v', "<Tab>", ">gv", {desc = "Add tab to visual selection"})
vim.keymap.set('v', "<S-Tab>", "<gv", {desc = "Remove tab from visual selection"})
