local map = vim.keymap.set

-- fzf-lua is lazy-loaded: requiring it inside a callback loads it on first use.
local function fzf() return require('fzf-lua') end

-- Neutralise bare Space so leader never moves the cursor.
map({ 'n', 'x' }, '<Space>', '<Nop>', { desc = 'leader' })

map('n', '<leader>f', function()
  if vim.fs.root(0, '.git') then
    fzf().git_files()
  else
    fzf().files()
  end
end, { desc = 'files (project)' })

map('n', '<leader>F', function() fzf().files() end, { desc = 'files (cwd)' })
map('n', '<leader>b', function() fzf().buffers() end, { desc = 'buffers' })
map('n', '<leader>j', function() fzf().jumps() end, { desc = 'jumplist' })
map('n', '<leader>g', function() fzf().git_status() end, { desc = 'changed files (git)' })
map('n', '<leader>/', function() fzf().live_grep() end, { desc = 'global search (live grep)' })
map('n', '<leader>?', function() fzf().commands() end, { desc = 'command palette' })
map('n', "<leader>'", function() fzf().resume() end, { desc = 'resume last picker' })

map({ 'n', 'x' }, '<leader>y', '"+y', { desc = 'yank → clipboard' })
map('n', '<leader>Y', '"+y$', { desc = 'yank to EOL → clipboard' })
map('n', '<leader>p', '"+p', { desc = 'paste from clipboard' })
map('n', '<leader>P', '"+P', { desc = 'paste before from clipboard' })
map('x', '<leader>R', '"+p', { desc = 'replace selection with clipboard' })

map('n', '<leader>w', '<C-w>', { desc = '+window' })       -- space w -> <C-w> prefix
map('n', '<leader>c', 'gcc', { remap = true, desc = 'toggle comment' })
map('x', '<leader>c', 'gc', { remap = true, desc = 'toggle comment' })

map('n', '<leader>k', function() vim.lsp.buf.hover() end, { desc = 'hover docs' })
map('n', '<leader>s', function() fzf().lsp_document_symbols() end, { desc = 'document symbols' })
map('n', '<leader>S', function() fzf().lsp_live_workspace_symbols() end, { desc = 'workspace symbols' })
map('n', '<leader>d', function() fzf().diagnostics_document() end, { desc = 'document diagnostics' })
map('n', '<leader>D', function() fzf().diagnostics_workspace() end, { desc = 'workspace diagnostics' })
map('n', '<leader>r', function() vim.lsp.buf.rename() end, { desc = 'rename symbol' })
map('n', '<leader>a', function() vim.lsp.buf.code_action() end, { desc = 'code action' })
map('n', '<leader>h', function() fzf().lsp_references() end, { desc = 'references' })
