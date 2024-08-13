local hlchunk_opts = {
    indent = {
        enable = true,
        chars = {'│'}
    },
    chunk = { enable = true }
}
local nvim_autopairs_opts = {
    disable_filetype = { "TelescopePrompt", "spectre_panel" },
    map_cr = true,
    fast_wrap = {},
}
return {
    hlchunk_opts = hlchunk_opts,
    nvim_autopairs_opts = nvim_autopairs_opts
}
