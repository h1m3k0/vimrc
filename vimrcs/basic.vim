" 基础配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 通用
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 取消兼容模式
set nocompatible

" Sets how many lines of history VIM has to remember
set history=500

" 映射的超时时间
set timeout
set timeoutlen=1500
" 键码的超时时间 解决部分终端由转义引起的"卡键"现象
set ttimeout
set ttimeoutlen=10

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
autocmd FocusGained,BufEnter * checktime

" 不显示默认启动信息
set shortmess+=I

" 共享系统剪切板
set clipboard^=unnamed,unnamedplus
" 鼠标 (不支持共享系统剪切板时不启用鼠标, 鼠标用于复制)
if has('clipboard') || has('ide')
    set mouse+=a
else
    set mouse-=a
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 用户界面
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 光标上下两侧最少保留的屏幕行数
set scrolloff=5

" 光标左右两侧最少保留的屏幕列数
set nowrap
set sidescrolloff=20
set sidescroll=1


" 命令行补全以增强模式运行
set wildmenu

" 显示光标位置的行号和列号
set ruler

" 显示当前命令
set showcmd

" 显示行号 相对行号
set number relativenumber

" 高亮显示当前行
set cursorline

" 退格键设置
set backspace=eol,start,indent

" 搜索智能大小写 高亮 动态显示
set ignorecase smartcase hlsearch incsearch
nohlsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" 正则表达式引擎
set regexpengine=0

" :substitute 设置默认flag为g
set gdefault

" <c-a>和<c-x> 处理数字格式(二进制, 十六进制, 无符号数)
set nrformats=bin,hex,unsigned

" 取消提示音
set noerrorbells visualbell
autocmd VimEnter * set t_vb=
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 颜色字体
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 语法高亮
syntax enable

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

" Set extra options when running in GUI mode
if has('gui_running')
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set fileformats=unix,dos,mac
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 备份文件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup nowritebackup noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 文本
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 将tab替换为空格
set expandtab

" Be smart when using tabs ;)
set smarttab

set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
set linebreak
set textwidth=500

set autoindent smartindent

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

""""""""""""""""""""""""""""""
" => GVim
""""""""""""""""""""""""""""""
if has('gui_running') && (has('win64') || has('win32'))
  " 设置字体大小 "
  let dpi = str2nr(strpart(matchstr(substitute(
    \system('wmic desktopmonitor get PixelsPerXLogicalInch /value'),
    \'\%x01\|\%x0a\|\%x0a\|\%xff\|\%xfe', '', 'g'),
    \'=.*$'), 1))/10
  if dpi > 10
    let &guifont = 'Consolas:h'.dpi
  else
    let &guifont = 'Consolas:h10'
  endif

  set columns=120 " 设置宽度
  set lines=30 " 设置高度
endif
