--   Server config names: https://github.com/neovim/nvim-lspconfig/tree/master/lsp
--   Override a server:   vim.lsp.config('<name>', { cmd = ..., settings = ... })
return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    -- completions from blink
    local caps = vim.lsp.protocol.make_client_capabilities()
    local ok, blink = pcall(require, 'blink.cmp')
    if ok then
      caps = blink.get_lsp_capabilities(caps)
    end
    vim.lsp.config('*', { capabilities = caps })

    -- per-server overrides 
    vim.lsp.config('lua_ls', {
      settings = { Lua = { diagnostics = { globals = { 'vim' } } } },
    })

    local servers = { 'lua_ls', 'clangd' }
    vim.lsp.enable(servers)
  end,
}
