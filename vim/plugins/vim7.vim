" 文件树 {{{1
Plug 'preservim/nerdtree' " => 文件树 {{{2
  " 切换目录时自动切换vim根目录
  let g:NERDTreeChDirMode = 2
  nnoremap <Leader>e <Esc>:<C-U>NERDTree
  nnoremap <silent> <Leader>ef <Esc>:<C-U>NERDTreeFind<CR>
  nnoremap <silent> <Leader>ee <Esc>:<C-U>NERDTreeMirror<CR>:NERDTreeFocus<CR>
  nnoremap <silent> <Leader>et <Esc>:<C-U>NERDTreeMirror<CR>:NERDTreeToggle<CR>
  nnoremap <silent> <Leader>ev <Esc>:<C-U>NERDTree <C-R>=g:vimdir<CR><CR>
  nnoremap <silent> <Leader>eh <Esc>:<C-U>NERDTree $HOME<CR>

" operator => .  y/c/d+s  gc  gr  ga  {{{1
Plug 'tpope/vim-repeat' " => 重复 . {{{2

Plug 'tpope/vim-surround' " => 环绕 y/c/d+s {{{2

Plug 'tpope/vim-commentary' " => 注释 gc {{{2

Plug 'vim-scripts/ReplaceWithRegister' " => 替换 gr {{{2

Plug 'junegunn/vim-easy-align' " => 对齐 ga {{{2
  nmap  ga  <Plug>(EasyAlign)
  xmap  ga  <Plug>(EasyAlign)
Plug 'tommcdo/vim-exchange' " => 互换操作 cx {{{2

" motion => i/a+e  i/a+i/I  i/a+a  %  <L>f/F  {{{1
Plug 'kana/vim-textobj-user' " => 自定义文本对象 {{{2

Plug 'kana/vim-textobj-entire' " => 全文文本对象 {{{2

Plug 'michaeljsmith/vim-indent-object' " => 缩进文本对象 {{{2

" Plug 'vim-scripts/argtextobj.vim' " => 参数文本对象 {{{2
  let g:argtextobj_pairs = '(:),{:},[:],<:>'
" Plug 'chrisbra/matchit' " => 匹配 {{{2
"   nmap M %
"   xmap M %
"   omap M %
Plug 'easymotion/vim-easymotion' " {{{2
  Plug 'ZSaberLv0/vim-easymotion-chs'
  " 智能大小写
  let g:EasyMotion_smartcase = 1
  " 禁用默认映射
  let g:EasyMotion_do_mapping = 0
  map  <Leader><Leader>f  <Plug>(easymotion-bd-f)
  map  <Leader><Leader>F  <Plug>(easymotion-bd-f)
  map  <Leader><Leader>t  <Plug>(easymotion-bd-t)
  map  <Leader><Leader>T  <Plug>(easymotion-bd-t)

" 编辑 {{{1
Plug 'tpope/vim-endwise' " => 轻量结尾补全 {{{2

Plug 'mattn/emmet-vim' " => html/css {{{2
  " 使用<Tab>键
  let g:user_emmet_expandabbr_key = '<Tab>'
  " 按文件加载
  let g:user_emmet_install_global = 0
  autocmd FileType xml,html,javascriptreact,typescriptreact,css,sass,less EmmetInstall

Plug 'kana/vim-arpeggio' " => 允许同时按键的映射 {{{2
  call plug#load('vim-arpeggio')  " 立刻加载
  if exists('g:loaded_arpeggio')
    Arpeggio inoremap jk <Esc>
    Arpeggio nnoremap io  :
  endif

" 其他 {{{1
Plug 'machakann/vim-highlightedyank' " => 复制高亮 {{{2
  if !exists('##TextYankPost')
    nmap y <Plug>(highlightedyank)
    xmap y <Plug>(highlightedyank)
    omap y <Plug>(highlightedyank)
  endif
  let g:highlightedyank_highlight_duration = 2000
Plug 'haya14busa/vim-asterisk' " => 星号井号搜索增强 {{{2
  let g:asterisk#keeppos = 1 " 保持光标位置
  map *  <Plug>(asterisk-z*)
  map #  <Plug>(asterisk-z#)
  map g* <Plug>(asterisk-gz*)
  map g# <Plug>(asterisk-gz#)
Plug 'tpope/vim-fugitive' " => Git {{{2

Plug 'simeji/winresizer' " => 窗口大小 {{{2
  let g:winresizer_gui_enable = 1
  let g:winresizer_start_key = '<C-E>'
  let g:winresizer_vert_resize = 1
  let g:winresizer_horiz_resize = 1

