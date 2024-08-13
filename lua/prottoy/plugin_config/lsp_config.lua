require("mason").setup({
    ui = {
        icons = {
            package_installed = " ",
            package_pending = "",
            package_uninstalled = "◍"
        }
    }
})

require("mason-lspconfig").setup({
    ensure_installed = {'lua_ls', "basedpyright", "clangd"},
})

local lsp_on_attach = function(_, bufnr)
    local opts = {noremap = true, silent = true, buffer = bufnr}

    opts.desc = "Lsp rename"
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    opts.desc = "Lsp hover info"
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    opts.desc = "Lsp type definition"
    vim.keymap.set('n', 'D', vim.lsp.buf.type_definition, opts)
    opts.desc = "Lsp code action"
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
    opts.desc = "Lsp references"
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    opts.desc = "Lsp implementations"
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    opts.desc = "Lsp declaration"
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    opts.desc = "Lsp definition"
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    opts.desc = "Lsp format buffer"
    vim.keymap.set({ 'n', 'v' }, '<leader>lf', vim.lsp.buf.format, opts)

    -- Telescope
    opts.desc = "Telescope lsp type definition"
    vim.keymap.set('n', 'TD', "<cmd>Telescope lsp_type_definitions<CR>", opts)
    opts.desc = "Telescope lsp references"
    vim.keymap.set('n', 'tr', "<cmd>Telescope lsp_references<CR>", opts)
    opts.desc = "Telescope lsp implementations"
    vim.keymap.set('n', 'ti', "<cmd>Telescope lsp_implementations<CR>", opts)
    opts.desc = "Telescope lsp declaration"
    vim.keymap.set('n', 'tD', "<cmd>Telescope lsp_declarations<CR>", opts)
    opts.desc = "Telescope lsp definitions"
    vim.keymap.set('n', 'td', "<cmd>Telescope lsp_definitions<CR>" , opts)
    opts.desc = 'Document Symbols'
    vim.keymap.set('n', '<leader>ds', "<cmd>Telescope lsp_document_symbols<CR>", opts)
    opts.desc = 'Workspace Symbols'
    vim.keymap.set('n', '<leader>ws', "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", opts)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local c_compiler_path = "C:\\msys64\\mingw64\\bin\\gcc.exe,C:\\msys64\\mingw64\\bin\\cc.exe"
local cpp_compiler_path = "C:\\msys64\\mingw64\\bin\\g++.exe,C:\\msys64\\mingw64\\bin\\cpp.exe"
-- local pyrightconfig_path = "C:\\Users\\Prottoy\\pyrightconfig.json"

require("mason-lspconfig").setup_handlers({
    function(server_name)
        require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = lsp_on_attach,
        }
    end,
    ['clangd'] = function ()
        require("lspconfig").clangd.setup{
            capabilities = capabilities,
            on_attach = lsp_on_attach,
            cmd = {
                "clangd",
                "--query-driver=" .. c_compiler_path .. "," .. cpp_compiler_path,
            }
        }
    end,
    ['basedpyright'] = function ()
        require("lspconfig").basedpyright.setup{
            capabilities = capabilities,
            on_attach = lsp_on_attach,
            settings = {
                basedpyright = { typeCheckingMode = "standard" }
            }
        }
    end
})

local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

