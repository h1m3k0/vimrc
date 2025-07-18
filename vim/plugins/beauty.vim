" 主题
Plug 'sainnhe/everforest'
Plug 'lifepillar/vim-gruvbox8'
Plug 'sainnhe/gruvbox-material'
Plug 'lifepillar/vim-solarized8'
Plug 'nordtheme/vim', { 'as': 'nord' }
Plug 'junegunn/seoul256.vim'
Plug 'ku1ik/vim-monokai'
Plug 'tomasr/molokai'
if has('nvim')
    " nvim版本的主题
    Plug 'ellisonleao/gruvbox.nvim'
    Plug 'navarasu/onedark.nvim'
    Plug 'craftzdog/solarized-osaka.nvim'
    Plug 'catppuccin/nvim', { 'as': 'catppuccin.nvim' }
    Plug 'WTFox/jellybeans.nvim'

    " nvim独有的主题
    Plug 'Mofiqul/vscode.nvim', { 'as': 'vscode-theme' }
    Plug 'projekt0n/github-nvim-theme'
    Plug 'xiantang/darcula-dark.nvim'
    Plug 'folke/tokyonight.nvim'
    Plug 'rebelot/kanagawa.nvim'
    Plug 'rose-pine/neovim', { 'as': 'rose-pine' }
    Plug 'EdenEast/nightfox.nvim'
    finish
endif
" vim版的主题
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'catppuccin/vim', { 'as': 'catppuccin.vim' }
Plug 'nanotech/jellybeans.vim'

Plug 'vim-airline/vim-airline' " 状态栏
Plug 'vim-airline/vim-airline-themes'
" 只有一个tab时 显示buffers
let g:airline#extensions#tabline#enabled = 1
" 标题仅显示文件名
let g:airline#extensions#tabline#formatter = 'unique_tail'

Plug 'mhinz/vim-startify' " 启动页面
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
