local cmp = require("cmp")

require("luasnip.loaders.from_vscode").lazy_load()

local kind_icons = {
    Text = " ", Method = "󰆧 ", Function = "󰊕 ", Constructor = " ",
    Field = "󰇽 ", Variable = "󰫧 ", Class = "󰠱 ", Interface = " ",
    Module = " ", Property = " ", Unit = " ", Value = "󰎠 ",
    Enum = " ", Keyword = "󰌋 ", Snippet = " ", Color = "󰏘 ",
    File = "󰈙 ", Reference = " ", Folder = "󰉋 ", EnumMember = " ",
    Constant = "󰏿 ", Struct = " ", Event = " ", Operator = "󰆕 ",
    TypeParameter = " ",
}

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },

    mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ['<C-n>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<Tab>'] = cmp.mapping.confirm({ select = true })
    }),

    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'nvim_lsp_signature_help' }
    }),

    formatting = {
        fields = { 'kind', 'abbr', 'menu' },
        format = function (_, item)
            item.menu = (item.kind or '')
            item.kind = (kind_icons[item.kind] or '  ') .. ''
            return item
        end
    },
})

require('nvim-autopairs').setup({
    disable_filetype = { "TelescopePrompt", "spectre_panel" },
    map_cr = true,
    fast_wrap = {},
})

