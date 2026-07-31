return {
  'ggandor/leap.nvim',
  keys = {
    { 's',  '<Plug>(leap-forward)',     mode = { 'n', 'x', 'o' }, desc = 'Leap forward' },
    { 'S',  '<Plug>(leap-backward)',    mode = { 'n', 'x', 'o' }, desc = 'Leap backward' },
    { 'gs', '<Plug>(leap-from-window)', mode = { 'n' },           desc = 'Leap other windows' },
  },
  init = function()
    -- Swallow only leap's "moved to Codeberg" notice; everything else passes.
    local orig = vim.notify
    vim.notify = function(msg, ...)
      if type(msg) == 'string' and msg:find('moved to Codeberg') then
        return
      end
      return orig(msg, ...)
    end
  end,
}
