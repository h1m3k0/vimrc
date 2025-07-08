" operator
Plug 'tpope/vim-repeat' " => 重复 .
Plug 'tpope/vim-surround' " => 环绕 y/c/d+s
Plug 'tpope/vim-commentary' " => 注释 gc
Plug 'vim-scripts/ReplaceWithRegister' " => 替换 gr
Plug 'junegunn/vim-easy-align' " => 对齐 ga
nmap  ga  <Plug>(EasyAlign)
xmap  ga  <Plug>(EasyAlign)
Plug 'tommcdo/vim-exchange' " => 互换操作 cx

" motion
Plug 'kana/vim-textobj-user' " => 自定义文本对象
Plug 'kana/vim-textobj-entire' " => 全文文本对象
Plug 'michaeljsmith/vim-indent-object' " => 缩进文本对象
" Plug 'vim-scripts/argtextobj.vim' " => 参数文本对象
Plug 'easymotion/vim-easymotion' "
Plug 'ZSaberLv0/vim-easymotion-chs'
" 智能大小写
let g:EasyMotion_smartcase = 1
" 禁用默认映射
let g:EasyMotion_do_mapping = 0
map  <Leader><Leader>f  <Plug>(easymotion-bd-f)
map  <Leader><Leader>F  <Plug>(easymotion-bd-f)
map  <Leader><Leader>t  <Plug>(easymotion-bd-t)
map  <Leader><Leader>T  <Plug>(easymotion-bd-t)

" 其他
Plug 'machakann/vim-highlightedyank' " => 复制高亮
if !exists('##TextYankPost')
    nmap y <Plug>(highlightedyank)
    xmap y <Plug>(highlightedyank)
    omap y <Plug>(highlightedyank)
endif
let g:highlightedyank_highlight_duration = 2000

Plug 'haya14busa/vim-asterisk' " => 星号井号搜索增强
let g:asterisk#keeppos = 1 " 保持光标位置
map *  <Plug>(asterisk-z*)
map #  <Plug>(asterisk-z#)
map g* <Plug>(asterisk-gz*)
map g# <Plug>(asterisk-gz#)

Plug 'kana/vim-arpeggio' " => 允许同时按键的映射
call plug#load('vim-arpeggio')  " 立刻加载
if exists('g:loaded_arpeggio')
    Arpeggio inoremap jk <Esc>
    Arpeggio nnoremap io  :
endif

Plug 'simeji/winresizer' " => 窗口大小
let g:winresizer_enable = 1
let g:winresizer_start_key = '<C-W><C-E>'
let g:winresizer_gui_enable = 1
let g:winresizer_gui_start_key = '<C-W><C-A>'
let g:winresizer_vert_resize = 1
let g:winresizer_horiz_resize = 1

if v:version < 800
    finish
endif

Plug 'LunarWatcher/auto-pairs' " 自动括号
" 右边为非空字符时不自动添加括号
let g:AutoPairsCompleteOnlyOnSpace = 1
Plug 'chrisbra/matchit' " => 匹配
nmap M %
xmap M %
omap M %
Plug 'mg979/vim-visual-multi' " 多光标
let g:VM_maps                    = {}
let g:VM_maps['Undo']            = 'u'
let g:VM_maps['Redo']            = '<C-r>'
let g:VM_maps['Find Under']      = '<A-n>'        " 单词
let g:VM_maps['Add Cursor Down'] = '<A-Down>'     " 字符
let g:VM_maps['Add Cursor Up']   = '<A-Up>'       " 字符
let g:VM_maps['Mouse Cursor']    = '<A-LeftMouse>'
let g:VM_maps['Mouse Word']      = '<A-RightMouse>'
let g:VM_maps['Switch Mode']     = '<Tab>'

Plug 'skywind3000/asyncrun.vim'  " 将特定命令绑定映射时用到
Plug 'skywind3000/asynctasks.vim'
if has('win32')
    " windows系统使用GBK
    let g:asyncrun_encs = 'gbk'
endif
" 自动打开copen
let g:asyncrun_open = 6
nnoremap <Leader>t :AsyncTask 

if v:version < 900
    finish
endif

Plug 'yianwillis/vimcdoc' " 中文文档
