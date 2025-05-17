" 色彩方案 {{{1
let g:colorscheme = 'everforest'

Plug 'sainnhe/everforest'
Plug 'sainnhe/gruvbox-material'
Plug 'joshdick/onedark.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }

Plug 'ryanoasis/vim-devicons'  " => 图标     {{{2

Plug 'itchyny/lightline.vim'   " => 状态栏   {{{2
let g:lightline = {
      \   'colorscheme': g:colorscheme,
      \ }

Plug 'mhinz/vim-startify'      " => 启动页面 {{{2
  let g:startify_custom_header = ['']
  let g:startify_lists = [
        \   {'type': 'commands' }, 
        \   {'type': 'files',     'header': [' MRU'],      },
        \   {'type': 'sessions',  'header': []             },
        \   {'type': 'bookmarks', 'header': [' Bookmarks'] },
        \ ]
  let g:startify_files_number = 9
  let g:startify_commands = [
        \   {'n': ['new Typed buffer: 输入文件类型',
        \    'enew | execute "set filetype=".input("filetype=")']},
        \   {'p': ['new Pasted buffer: 粘贴剪切板内容', 
        \    'enew | execute "normal i\<S-Insert>\<Esc>"']},
        \   {'v': ['edit Vimrc: ' . substitute(g:vimrc, '\\', '/', 'g'),
        \    'edit ' . g:vimrc]},
        \ ]

  if has('gui_running')
    let g:startify_commands += [
          \   {'b': ['font bigger: 调大字体', 'GuiFontBigger']},
          \   {'s': ['font smaller: 调小字体', 'GuiFontSmaller']},
          \   {'f': ['full screen: 全屏', 'GuiFullScreen']},
          \ ]
  endif
