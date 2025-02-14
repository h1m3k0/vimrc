" 文件树 {{{
Plug 'preservim/nerdtree'
" 切换目录时自动切换vim根目录
let NERDTreeChDirMode = 2
nnoremap  <Leader>e   <Esc>:<C-U>NERDTree
nnoremap  <Leader>ef  <Esc>:<C-U>NERDTreeFind<CR>
nnoremap  <Leader>et  <Esc>:<C-U>NERDTreeToggle<CR>
nnoremap  <Leader>ev  <Esc>:<C-U>NERDTree $MYVIMDIR<CR>
nnoremap  <Leader>eh  <Esc>:<C-U>NERDTree $HOME<CR>
" }}}

" operator {{{
Plug 'tpope/vim-repeat'                " 重复 .
Plug 'tpope/vim-surround'              " 环绕 ys cs ds
Plug 'tpope/vim-commentary'            " 注释 gc
Plug 'vim-scripts/ReplaceWithRegister' " 替换 gr
Plug 'junegunn/vim-easy-align'         " 对齐 ga
nmap  ga  <Plug>(EasyAlign)
xmap  ga  <Plug>(EasyAlign)
" }}}

" motion {{{
Plug 'kana/vim-textobj-user'           " 自定义文本对象 
Plug 'kana/vim-textobj-entire'         " 全文文本对象
Plug 'michaeljsmith/vim-indent-object' " 缩进文本对象
Plug 'vim-scripts/argtextobj.vim'      " 参数文本对象
let g:argtextobj_pairs = '(:),{:},[:],<:>'

Plug 'chrisbra/matchit'                " 匹配
nmap M %
xmap M %
omap M %
" }}}

" 编辑 {{{
Plug 'LunarWatcher/auto-pairs'         " 自动括号
" 右边为非空字符时不自动添加括号
let g:AutoPairsCompleteOnlyOnSpace = 1
" }}}

" 样式 {{{
Plug 'sainnhe/everforest'
Plug 'machakann/vim-highlightedyank'   " 复制高亮
if !exists('##TextYankPost')
  nmap y <Plug>(highlightedyank)
  xmap y <Plug>(highlightedyank)
  omap y <Plug>(highlightedyank)
endif
let g:highlightedyank_highlight_duration = 2000
" }}}
