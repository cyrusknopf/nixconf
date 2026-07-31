-- fzf-lua
return {
  'ibhagwan/fzf-lua',
  lazy = true,
  cmd = 'FzfLua',
  opts = {
    winopts = {
      height = 0.85,
      width = 0.85,
      -- toggle preview with <C-/>
      preview = { hidden = true, layout = 'horizontal' },
    },
    keymap = {
      fzf = {
        ['tab'] = 'down',
        ['btab'] = 'up',
        ['ctrl-q'] = 'select-all+accept',
      },
    },
  },
}
