" 色彩方案 {{{1
Plug 'sainnhe/everforest'
Plug 'sainnhe/gruvbox-material'
Plug 'joshdick/onedark.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }

Plug 'vim-airline/vim-airline'   " => 状态栏   {{{2
    Plug 'vim-airline/vim-airline-themes'
    " 只有一个tab时 显示buffers
    let g:airline#extensions#tabline#enabled = 1
    " 标题仅显示文件名
    let g:airline#extensions#tabline#formatter = 'unique_tail'

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
