" 文件树 {{{
Plug 'preservim/nerdtree'
" NERDTree 配置 {{{
" 切换目录时自动切换vim根目录
let NERDTreeChDirMode = 2
nnoremap  <Leader>e   <Esc>:<C-U>NERDTree
nnoremap  <Leader>ef  <Esc>:<C-U>NERDTreeFind<CR>
nnoremap  <Leader>et  <Esc>:<C-U>NERDTreeToggle<CR>
nnoremap  <Leader>ev  <Esc>:<C-U>NERDTree $MYVIMDIR<CR>
nnoremap  <Leader>eh  <Esc>:<C-U>NERDTree $HOME<CR>
" }}}}}}

" operator . ys cs ds gc gr ga {{{
" 重复 .
Plug 'tpope/vim-repeat'
" 环绕 ys cs ds
Plug 'tpope/vim-surround'
" 注释 gc
Plug 'tpope/vim-commentary'
" 替换 gr
Plug 'vim-scripts/ReplaceWithRegister'
" 对齐 ga
Plug 'junegunn/vim-easy-align'
" easy-align 配置 {{{
nmap  ga  <Plug>(EasyAlign)
xmap  ga  <Plug>(EasyAlign)
" }}}}}}

" motion {{{
" 自定义文本对象 
Plug 'kana/vim-textobj-user'
" 全文文本对象
Plug 'kana/vim-textobj-entire'
" 缩进文本对象
Plug 'michaeljsmith/vim-indent-object'
" 参数文本对象
Plug 'vim-scripts/argtextobj.vim'
" argtextobj 配置 {{{
let g:argtextobj_pairs = '(:),{:},[:],<:>'
" }}}
" 匹配
Plug 'chrisbra/matchit'
" {{{
nmap M %
xmap M %
omap M %
" }}}
" easymotion
Plug 'easymotion/vim-easymotion'
" easymotion中文
Plug 'ZSaberLv0/vim-easymotion-chs'
" easymotion 配置 {{{
" 智能大小写
let g:EasyMotion_smartcase = 1
" 禁用默认映射
let g:EasyMotion_do_mapping = 0
map  <Leader>f  <Plug>(easymotion-bd-f)
map  <Leader>F  <Plug>(easymotion-bd-f)
map  <Leader>t  <Plug>(easymotion-bd-t)
map  <Leader>T  <Plug>(easymotion-bd-t)
" }}}}}}

" 编辑 {{{
Plug 'LunarWatcher/auto-pairs'         " 自动括号
" auto-pairs 配置 {{{
" 右边为非空字符时不自动添加括号
let g:AutoPairsCompleteOnlyOnSpace = 1
" 轻量补全
Plug 'tpope/vim-endwise'
" }}}}}}

" 样式 {{{
" 色彩方案
Plug 'sainnhe/everforest'
" 复制高亮
Plug 'machakann/vim-highlightedyank'
" highlightedyank 配置 {{{
if !exists('##TextYankPost')
  nmap y <Plug>(highlightedyank)
  xmap y <Plug>(highlightedyank)
  omap y <Plug>(highlightedyank)
endif
let g:highlightedyank_highlight_duration = 2000
" }}}}}}
