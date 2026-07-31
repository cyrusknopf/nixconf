-- <Tab> accept · <M-]> next · <M-[> prev · <C-]> dismiss
return {
  'Exafunction/windsurf.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  event = 'InsertEnter',
  config = function()
    -- Module is still `codeium` in windsurf.nvim; fall back to `windsurf`.
    local ok, m = pcall(require, 'codeium')
    if not ok then m = require('windsurf') end
    m.setup({
      enable_cmp_source = false, -- we use ghost text, not a blink/cmp source
      virtual_text = {
        enabled = true,
        key_bindings = {
          accept = '<Tab>',
          next = '<M-]>',
          prev = '<M-[>',
          clear = '<C-]>',
        },
      },
    })
  end,
}
