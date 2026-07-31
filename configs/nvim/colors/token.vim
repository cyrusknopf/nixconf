" token.vim — Vim port of the Token colorscheme
"   upstream: https://github.com/ThorstenRhau/token (BSD 3-Clause)
"   Generated from lua/token/palette.lua — do not hand-edit.
"
"   Install: ~/.vim/colors/token.vim
"   Use:     set termguicolors | set background=dark | colorscheme token

hi clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name = 'token'

if &background ==# 'light'
  let s:p = {
      \ 'accent': ['#9a4929', '94'],
      \ 'accent2': ['#876032', '95'],
      \ 'bg0': ['#e6e5e1', '254'],
      \ 'bg1': ['#ecebe7', '255'],
      \ 'bg2': ['#f6f5f1', '255'],
      \ 'bg3': ['#faf9f5', '231'],
      \ 'bg4': ['#f0efeb', '255'],
      \ 'bg5': ['#eae9e5', '254'],
      \ 'blue': ['#527594', '66'],
      \ 'bright_blue': ['#486a88', '60'],
      \ 'bright_cyan': ['#286363', '23'],
      \ 'bright_green': ['#3a5e37', '238'],
      \ 'bright_purple': ['#6f578c', '60'],
      \ 'cyan': ['#2d6c6c', '23'],
      \ 'diag_error': ['#ffdada', '224'],
      \ 'diag_hint': ['#d6eeea', '254'],
      \ 'diag_info': ['#dae4f2', '254'],
      \ 'diag_warn': ['#e2dac0', '187'],
      \ 'diff_add': ['#daf6d5', '194'],
      \ 'diff_add_inline': ['#c0d8bc', '151'],
      \ 'diff_add_strong': ['#a8c8a2', '151'],
      \ 'diff_change': ['#eee4c6', '224'],
      \ 'diff_del': ['#ffdada', '224'],
      \ 'diff_del_inline': ['#e8c4c4', '252'],
      \ 'diff_del_strong': ['#d8aaaa', '181'],
      \ 'diff_text': ['#e2dac0', '187'],
      \ 'fg0': ['#2a2920', '235'],
      \ 'fg1': ['#3d3929', '236'],
      \ 'fg2': ['#6c675f', '241'],
      \ 'fg3': ['#858179', '244'],
      \ 'green': ['#3f643c', '239'],
      \ 'gsign_add': ['#24831f', '28'],
      \ 'gsign_add_staged': ['#5ea059', '71'],
      \ 'gsign_change': ['#9d6600', '130'],
      \ 'gsign_change_staged': ['#b28c43', '137'],
      \ 'gsign_del': ['#c82a2a', '160'],
      \ 'gsign_del_staged': ['#d17473', '173'],
      \ 'gsign_untracked': ['#a5a29b', '247'],
      \ 'gsign_untracked_staged': ['#858179', '244'],
      \ 'indent': ['#e0ddd8', '253'],
      \ 'indent_active': ['#a8a49c', '247'],
      \ 'line_nr': ['#b5b2ab', '249'],
      \ 'match': ['#e8d8b0', '187'],
      \ 'olive': ['#63742f', '64'],
      \ 'orange': ['#9a5f22', '94'],
      \ 'purple': ['#7c619a', '96'],
      \ 'red': ['#b05555', '131'],
      \ 'sel': ['#dddcd6', '253'],
      \ 'yellow': ['#6e5c20', '58'],
      \ }
else
  let s:p = {
      \ 'accent': ['#d97757', '173'],
      \ 'accent2': ['#c4956a', '173'],
      \ 'bg0': ['#191918', '234'],
      \ 'bg1': ['#1d1d1c', '234'],
      \ 'bg2': ['#212120', '234'],
      \ 'bg3': ['#262624', '235'],
      \ 'bg4': ['#2f2f2d', '236'],
      \ 'bg5': ['#383835', '237'],
      \ 'blue': ['#7b9ebd', '109'],
      \ 'bright_blue': ['#96b8d3', '110'],
      \ 'bright_cyan': ['#88c0c0', '109'],
      \ 'bright_green': ['#98bf95', '108'],
      \ 'bright_purple': ['#bea5d4', '146'],
      \ 'cyan': ['#6ba8a8', '73'],
      \ 'diag_error': ['#3c2024', '235'],
      \ 'diag_hint': ['#1c2e2e', '235'],
      \ 'diag_info': ['#1e2634', '235'],
      \ 'diag_warn': ['#444039', '237'],
      \ 'diff_add': ['#1e3524', '235'],
      \ 'diff_add_inline': ['#2e5232', '237'],
      \ 'diff_add_strong': ['#3a6e3e', '239'],
      \ 'diff_change': ['#2b2b29', '235'],
      \ 'diff_del': ['#3c2024', '235'],
      \ 'diff_del_inline': ['#5a2529', '237'],
      \ 'diff_del_strong': ['#7a2e34', '239'],
      \ 'diff_text': ['#444039', '237'],
      \ 'fg0': ['#e8e4dc', '254'],
      \ 'fg1': ['#d4cfc6', '252'],
      \ 'fg2': ['#938e87', '245'],
      \ 'fg3': ['#5a5955', '240'],
      \ 'green': ['#7da47a', '108'],
      \ 'gsign_add': ['#7da47a', '108'],
      \ 'gsign_add_staged': ['#5e7a5c', '65'],
      \ 'gsign_change': ['#c4a855', '179'],
      \ 'gsign_change_staged': ['#88753f', '101'],
      \ 'gsign_del': ['#c67777', '174'],
      \ 'gsign_del_staged': ['#9a5f5f', '95'],
      \ 'gsign_untracked': ['#7a7670', '243'],
      \ 'gsign_untracked_staged': ['#5a5955', '240'],
      \ 'indent': ['#333330', '236'],
      \ 'indent_active': ['#636360', '241'],
      \ 'line_nr': ['#585855', '240'],
      \ 'match': ['#4a4030', '237'],
      \ 'olive': ['#a8b56b', '143'],
      \ 'orange': ['#d4914a', '173'],
      \ 'purple': ['#a68bbf', '139'],
      \ 'red': ['#c67777', '174'],
      \ 'sel': ['#3a3a37', '237'],
      \ 'yellow': ['#c4a855', '179'],
      \ }
endif

" [group, fg, bg, attrs, sp] — empty string means "leave alone"
let s:g = [
      \ ['Normal', 'fg0', 'bg3', '', ''],
      \ ['Cursor', 'bg3', 'fg0', '', ''],
      \ ['CursorLine', '', 'bg4', '', ''],
      \ ['CursorColumn', '', 'bg4', '', ''],
      \ ['CursorLineNr', 'olive', '', 'bold', ''],
      \ ['LineNr', 'line_nr', 'bg2', '', ''],
      \ ['LineNrAbove', 'line_nr', 'bg2', '', ''],
      \ ['LineNrBelow', 'line_nr', 'bg2', '', ''],
      \ ['SignColumn', 'fg3', 'bg2', '', ''],
      \ ['FoldColumn', 'fg3', 'bg2', '', ''],
      \ ['Folded', 'fg2', 'bg2', '', ''],
      \ ['ColorColumn', '', 'bg4', '', ''],
      \ ['VertSplit', 'bg4', '', '', ''],
      \ ['StatusLine', 'fg1', 'bg1', '', ''],
      \ ['StatusLineNC', 'fg3', 'bg1', '', ''],
      \ ['StatusLineTerm', 'fg1', 'bg1', '', ''],
      \ ['StatusLineTermNC', 'fg3', 'bg1', '', ''],
      \ ['TabLine', 'fg2', 'bg1', '', ''],
      \ ['TabLineFill', 'fg3', 'bg1', '', ''],
      \ ['TabLineSel', 'fg0', 'bg3', 'bold', ''],
      \ ['Pmenu', 'fg0', 'bg1', '', ''],
      \ ['PmenuSel', 'fg0', 'sel', 'bold', ''],
      \ ['PmenuSbar', '', 'bg2', '', ''],
      \ ['PmenuThumb', '', 'fg3', '', ''],
      \ ['PmenuKind', 'blue', 'bg1', '', ''],
      \ ['PmenuKindSel', 'blue', 'sel', '', ''],
      \ ['PmenuExtra', 'fg2', 'bg1', '', ''],
      \ ['PmenuExtraSel', 'fg2', 'sel', '', ''],
      \ ['PmenuMatch', 'accent', 'bg1', 'bold', ''],
      \ ['PmenuMatchSel', 'accent', 'sel', 'bold', ''],
      \ ['Visual', '', 'sel', '', ''],
      \ ['VisualNOS', '', 'sel', '', ''],
      \ ['Search', 'fg0', 'match', '', ''],
      \ ['IncSearch', 'bg3', 'accent2', '', ''],
      \ ['CurSearch', 'bg3', 'accent', '', ''],
      \ ['MatchParen', 'accent', '', 'bold,underline', ''],
      \ ['WildMenu', 'bg3', 'accent2', '', ''],
      \ ['QuickFixLine', '', 'bg5', '', ''],
      \ ['Directory', 'blue', '', '', ''],
      \ ['Title', 'accent', '', 'bold', ''],
      \ ['Question', 'green', '', '', ''],
      \ ['MoreMsg', 'green', '', '', ''],
      \ ['ModeMsg', 'fg1', '', 'bold', ''],
      \ ['WarningMsg', 'yellow', '', '', ''],
      \ ['ErrorMsg', 'red', '', '', ''],
      \ ['NonText', 'indent', '', '', ''],
      \ ['SpecialKey', 'fg3', '', '', ''],
      \ ['EndOfBuffer', 'bg4', '', '', ''],
      \ ['Conceal', 'fg2', '', '', ''],
      \ ['Terminal', 'fg0', 'bg3', '', ''],
      \ ['qfLineNr', 'fg2', '', '', ''],
      \ ['qfFileName', 'blue', '', '', ''],
      \ ['SpellBad', '', '', 'undercurl', 'red'],
      \ ['SpellCap', '', '', 'undercurl', 'yellow'],
      \ ['SpellLocal', '', '', 'undercurl', 'blue'],
      \ ['SpellRare', '', '', 'undercurl', 'purple'],
      \ ['DiffAdd', '', 'diff_add', '', ''],
      \ ['DiffDelete', '', 'diff_del', '', ''],
      \ ['DiffChange', '', 'diff_change', '', ''],
      \ ['DiffText', '', 'diff_text', '', ''],
      \ ['Added', 'green', '', '', ''],
      \ ['Changed', 'yellow', '', '', ''],
      \ ['Removed', 'red', '', '', ''],
      \ ['Comment', 'fg2', '', 'italic', ''],
      \ ['Constant', 'purple', '', '', ''],
      \ ['String', 'green', '', '', ''],
      \ ['Character', 'green', '', '', ''],
      \ ['Number', 'orange', '', '', ''],
      \ ['Boolean', 'orange', '', '', ''],
      \ ['Float', 'orange', '', '', ''],
      \ ['Identifier', 'fg0', '', '', ''],
      \ ['Function', 'accent', '', '', ''],
      \ ['Statement', 'accent2', '', '', ''],
      \ ['Conditional', 'accent2', '', '', ''],
      \ ['Repeat', 'accent2', '', '', ''],
      \ ['Label', 'accent2', '', '', ''],
      \ ['Operator', 'fg1', '', '', ''],
      \ ['Keyword', 'accent2', '', '', ''],
      \ ['Exception', 'red', '', '', ''],
      \ ['PreProc', 'purple', '', '', ''],
      \ ['Include', 'purple', '', '', ''],
      \ ['Define', 'purple', '', '', ''],
      \ ['Macro', 'purple', '', '', ''],
      \ ['PreCondit', 'purple', '', '', ''],
      \ ['Type', 'blue', '', '', ''],
      \ ['StorageClass', 'accent2', '', '', ''],
      \ ['Structure', 'blue', '', '', ''],
      \ ['Typedef', 'blue', '', '', ''],
      \ ['Special', 'purple', '', '', ''],
      \ ['SpecialChar', 'purple', '', '', ''],
      \ ['Tag', 'purple', '', '', ''],
      \ ['Delimiter', 'fg1', '', '', ''],
      \ ['SpecialComment', 'fg2', '', 'italic', ''],
      \ ['Debug', 'red', '', '', ''],
      \ ['Underlined', '', '', 'underline', ''],
      \ ['Bold', '', '', 'bold', ''],
      \ ['Italic', '', '', 'italic', ''],
      \ ['Ignore', 'fg3', '', '', ''],
      \ ['Error', 'red', '', 'bold', ''],
      \ ['Todo', 'yellow', '', 'bold', ''],
      \ ]

for [s:grp, s:fg, s:bg, s:at, s:sp] in s:g
  let s:c = 'hi ' . s:grp
  if s:fg !=# '' | let s:c .= ' guifg=' . s:p[s:fg][0] . ' ctermfg=' . s:p[s:fg][1]
  else | let s:c .= ' guifg=NONE ctermfg=NONE' | endif
  if s:bg !=# '' | let s:c .= ' guibg=' . s:p[s:bg][0] . ' ctermbg=' . s:p[s:bg][1]
  else | let s:c .= ' guibg=NONE ctermbg=NONE' | endif
  let s:c .= ' guisp=' . (s:sp ==# '' ? 'NONE' : s:p[s:sp][0])
  let s:c .= ' gui=' . (s:at ==# '' ? 'NONE' : s:at)
  let s:c .= ' cterm=' . (s:at ==# '' ? 'NONE' : s:at)
  execute s:c
endfor
unlet! s:grp s:fg s:bg s:at s:sp s:c s:g

hi! link lCursor Cursor
hi! link CursorIM Cursor
hi! link WinSeparator VertSplit
hi! link DiffTextAdd DiffAdd

" Terminal ANSI palette (:terminal), from lua/token/terminal.lua
if has('terminal')
  let g:terminal_ansi_colors = &background ==# 'light'
        \ ? ['#2a2920', '#b05555', '#3f643c', '#6e5c20', '#527594', '#7c619a', '#2d6c6c', '#b5b2ab', '#6c675f', '#9a4929', '#3a5e37', '#876032', '#486a88', '#6f578c', '#286363', '#faf9f5']
        \ : ['#1d1d1c', '#c67777', '#7da47a', '#c4a855', '#7b9ebd', '#a68bbf', '#6ba8a8', '#d4cfc6', '#5a5955', '#d97757', '#98bf95', '#c4956a', '#96b8d3', '#bea5d4', '#88c0c0', '#e8e4dc']
endif
