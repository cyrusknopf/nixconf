# Neovim config

A port of the Helix **`Space`** layer from `~/.vim` — reproducing Helix's
picker/LSP menu and nothing else. Your old `~/.vimrc` and `~/.vim` are left
untouched; this lives entirely under `~/.config/nvim`.

## First run

Open `nvim`. On first launch lazy.nvim bootstraps itself and installs every
plugin. Then, one-time:

| Step | Command | Why |
|------|---------|-----|
| Sync plugins | `:Lazy sync` | (runs automatically on first launch) |
| Auth Codeium | `:Codeium Auth` | paste the token it prints a URL for |

**LSP servers are managed by you — there is no mason.** Install a server's
binary however you like (nix, distro package, release download) and put it on
`$PATH`, then add its name to the `servers` list in `lua/plugins/lsp.lua`. A
server attaches only when its binary is found, so listing one you haven't
installed yet is harmless. `nvim-lspconfig` is present only to supply each
server's default `cmd`/root-markers/filetypes — it installs nothing.

## The Space layer

| Key | Action | | Key | Action |
|-----|--------|-|-----|--------|
| `<Space>f` | files (project/git) | | `<Space>k` | hover docs |
| `<Space>F` | files (cwd) | | `<Space>s` | document symbols |
| `<Space>b` | buffers | | `<Space>S` | workspace symbols |
| `<Space>j` | jumplist | | `<Space>d` | document diagnostics |
| `<Space>g` | changed files (git) | | `<Space>D` | workspace diagnostics |
| `<Space>/` | global search (live grep) | | `<Space>r` | rename symbol |
| `<Space>?` | command palette | | `<Space>a` | code action |
| `<Space>'` | resume last picker | | `<Space>h` | references |
| `<Space>y/Y/p/P` | clipboard yank/paste | | `<Space>c` | toggle comment |
| `<Space>R` | replace selection w/ clipboard (visual) | | `<Space>w` | window mode (`<C-w>`) |

Press `<Space>` and pause to see the which-key popup (Helix preset).

## Motions & completion (not part of the Space layer)

- **leap** (replaces sneak): `s` leap · `S` leap from window · `gs` other windows
- **blink.cmp** completion menu: `<CR>`/`<C-y>` accept · `<C-n>`/`<C-p>` navigate
- **Codeium** ghost text: `<Tab>` accept · `<M-]>`/`<M-[>` next/prev · `<C-]>` dismiss

## Layout

```
init.lua                    entry: leader, requires, colorscheme
lua/config/options.lua      ported :set options
lua/config/keymaps.lua      the Space layer (this is the menu)
lua/config/diagnostics.lua  virtual_text/signs off, float on CursorHold
lua/config/lazy.lua         plugin-manager bootstrap
lua/plugins/picker.lua      fzf-lua
lua/plugins/lsp.lua         native LSP (no mason — you install servers)
lua/plugins/completion.lua  blink.cmp
lua/plugins/ai.lua          windsurf.nvim (Codeium)
lua/plugins/motion.lua      leap.nvim
lua/plugins/whichkey.lua    which-key.nvim
colors/                     ported colorschemes (challenger_deep active)
```

## What maps to what

| Vim (`~/.vim`) | Neovim |
|----------------|--------|
| fzf.vim + `lsp-diagnostics-fzf.vim` | fzf-lua |
| vim-sneak | leap.nvim |
| vim-lsp | native `vim.lsp` + nvim-lspconfig (config data only) |
| vim-lsp-settings | _(none — you install servers yourself)_ |
| vim-which-key | which-key.nvim |
| vim-commentary | built-in `gc`/`gcc` |
| windsurf.vim | windsurf.nvim |
| vim-plug / native `pack` | lazy.nvim |
| _(none — omnifunc only)_ | blink.cmp (new) |
