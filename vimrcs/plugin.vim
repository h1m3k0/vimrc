" 插件配置
" ========== 插件加载前配置 开始 ==========
" << NERDTree >>
" 切换目录时自动切换vim根目录
let NERDTreeChDirMode = 2

" << EasyMotion >>
" 智能大小写
let g:EasyMotion_smartcase = 1
" 禁用默认映射
let g:EasyMotion_do_mapping = 0

" << argtextobj >>
" ideavim 泛型
let g:argtextobj_pairs = '(:),{:},<:>'

" << highlightedyank >>
" 显示时间
let g:highlightedyank_highlight_duration = 2000
if has('ide')  " 注: ideavim 类型为 string
    let g:highlightedyank_highlight_duration = ''.g:highlightedyank_highlight_duration
endif

" << quick-scope >>
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" << multi-cursors >>
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_start_word_key      = '<A-n>'
let g:multi_cursor_select_all_word_key = '<Nop>'
let g:multi_cursor_start_key           = 'g<A-n>'
let g:multi_cursor_select_all_key      = '<Nop>'
let g:multi_cursor_next_key            = '<A-n>'
let g:multi_cursor_prev_key            = '<A-p>'
let g:multi_cursor_skip_key            = '<A-x>'
let g:multi_cursor_quit_key            = '<Esc>'
" ---------- 插件加载前配置 结束 ----------

" ========== vim-plug 启用插件 开始 ==========
execute 'call plug#begin('.(exists("g:custom_config_vim_plug_path") && g:custom_config_vim_plug_path != ''?"'".g:custom_config_vim_plug_path."'":'').')'
" 中文文档
Plug 'yianwillis/vimcdoc'

" 主题色
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'

" IdeaVim支持的插件
Plug 'easymotion/vim-easymotion'        " 快速跳转 [motions]
" Plug 'justinmk/vim-sneak'
Plug 'preservim/nerdtree'               " 文件树
Plug 'tpope/vim-surround'               " 环绕操作 [operator] (y/c/d)s
Plug 'terryma/vim-multiple-cursors'     " 多光标
Plug 'tpope/vim-commentary'             " 注释操作 [operator] gc
Plug 'vim-scripts/ReplaceWithRegister'  " 替换操作 [operator] gr
Plug 'vim-scripts/argtextobj.vim'       " 参数文本对象 [text-objects] (i/a)a
Plug 'tommcdo/vim-exchange'             " 互换操作 [operator] cx
Plug 'kana/vim-textobj-entire'          " 全文文本对象 [text-objects] (i/a)e
Plug 'machakann/vim-highlightedyank'    " 复制高亮
Plug 'dbakker/vim-paragraph-motion'     " 大括号增强 (只含有空格的行)
Plug 'michaeljsmith/vim-indent-object'  " 缩进文本对象 [text-objects] ii当前 ai包含上一行 aI包含上下
Plug 'chrisbra/matchit'                 " 百分号增强 (自定义匹配内容, IdeaVim中默认可匹配 HTML标签/if-else 等)
Plug 'unblevable/quick-scope'           " 高亮每个单词中唯一的字符
if has('ide')
    set quickscope
endif
" Plug 'liuchengxu/vim-which-key'         " 实时显示组合键
" if has('ide')
"     set which-key
" endif

" 其他插件
Plug 'ZSaberLv0/vim-easymotion-chs'     " easymotion中文扩展
Plug 'tpope/vim-repeat'                 " tpope的点扩展
Plug 'kana/vim-textobj-user'            " 自定义文本对象 (vim-textobj-entire前置插件)
Plug 'vim-airline/vim-airline'          " 状态栏
Plug 'vim-airline/vim-airline-themes'   " 状态栏主题
Plug 'junegunn/fzf',{'do':{->fzf#install()}}
Plug 'junegunn/fzf.vim'                 " fzf
Plug 'mhinz/vim-startify'               " 启动页面
call plug#end()
" ---------- vim-plug 启用插件 结束 ----------

" ========== 插件加载后配置 开始 ==========
"
" colorscheme
try
  colorscheme onedark
  set background=dark
catch
endtry

" << NERDTree >>
nnoremap  <leader>nn  <esc>:NERDTree
nnoremap  <leader>nf  <esc>:NERDTreeFind<cr>
nnoremap  <leader>nt  <esc>:NERDTreeToggle<cr>

" << EasyMotion >>
map  <leader>f  <Plug>(easymotion-bd-f)
map  <leader>t  <Plug>(easymotion-bd-t)

" << quickscope >>
" 禁止操作符等待时高亮
onoremap  f  f
onoremap  F  F
onoremap  t  t
onoremap  T  T

" << fzf >>
" 映射搜索
command!  Nmaps  call  fzf#vim#maps('n', 0)
command!  Imaps  call  fzf#vim#maps('i', 0)
command!  Cmaps  call  fzf#vim#maps('c', 0)
command!  Vmaps  call  fzf#vim#maps('v', 0)
command!  Xmaps  call  fzf#vim#maps('x', 0)
command!  Smaps  call  fzf#vim#maps('s', 0)
command!  Omaps  call  fzf#vim#maps('o', 0)
command!  Tmaps  call  fzf#vim#maps('t', 0)
command!  Lmaps  call  fzf#vim#maps('l', 0)

" << startify >>
runtime vimrcs/startify.vim
" ---------- 插件加载后配置 结束 ----------