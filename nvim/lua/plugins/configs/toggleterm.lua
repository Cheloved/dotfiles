require("toggleterm").setup {
    size = 20,
    -- open_mapping = [[<Leader>\]],
    auto_scroll = true,
    direction = 'float',
    float_opts = {
        border = 'curved',
    },
}

vim.keymap.set("n", "<Leader>\\", '<Cmd>ToggleTerm<Cr>')
