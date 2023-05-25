-- We're going to define single-letter keymaps, so don't try to define them
-- in the terminal window.  The debugger CLI should continue accepting text commands.
function NvimGdbNoTKeymaps()
  -- tnoremap <silent> <buffer> <esc> <c-\><c-n>
    vim.keymap.set("n", "<esc>", '<c-><c-n>')
end

vim.g.nvimgdb_config_override = {
    key_next       = "n",
    key_step       = 's',
    key_finish     = 'f',
    key_continue   = 'c',
    key_until      = 'u',
    key_breakpoint = 'b',
    set_tkeymaps   = "NvimGdbNoTKeymaps",
}
