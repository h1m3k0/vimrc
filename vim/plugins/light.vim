vim9script
# 文件树 {{{1
Plug 'preservim/nerdtree' # => 文件树 {{{2
  # 切换目录时自动切换vim根目录
  g:NERDTreeChDirMode = 2
  nnoremap <Leader>e <Esc>:<C-U>NERDTree
  nnoremap <silent> <Leader>ef <Esc>:<C-U>NERDTreeFind<CR>
  nnoremap <silent> <Leader>ee <Esc>:<C-U>NERDTreeMirror<CR>:NERDTreeFocus<CR>
  nnoremap <silent> <Leader>et <Esc>:<C-U>NERDTreeMirror<CR>:NERDTreeToggle<CR>
  nnoremap <silent> <Leader>ev <Esc>:<C-U>NERDTree <C-R>=g:vimdir<CR><CR>
  nnoremap <silent> <Leader>eh <Esc>:<C-U>NERDTree $HOME<CR>

# operator => .  y/c/d+s  gc  gr  ga  {{{1
Plug 'tpope/vim-repeat' # => 重复 . {{{2

Plug 'tpope/vim-surround' # => 环绕 y/c/d+s {{{2

Plug 'tpope/vim-commentary' # => 注释 gc {{{2

Plug 'vim-scripts/ReplaceWithRegister' # => 替换 gr {{{2

Plug 'junegunn/vim-easy-align' # => 对齐 ga {{{2
  nmap  ga  <Plug>(EasyAlign)
  xmap  ga  <Plug>(EasyAlign)

# motion => i/a+e  i/a+i/I  i/a+a  %  <L>f/F  {{{1
Plug 'kana/vim-textobj-user' # => 自定义文本对象 {{{2

Plug 'kana/vim-textobj-entire' # => 全文文本对象 {{{2

Plug 'michaeljsmith/vim-indent-object' # => 缩进文本对象 {{{2

# Plug 'vim-scripts/argtextobj.vim' # => 参数文本对象 {{{2
  g:argtextobj_pairs = '(:),{:},[:],<:>'
# Plug 'chrisbra/matchit' # => 匹配 {{{2
#   nmap M %
#   xmap M %
#   omap M %
Plug 'easymotion/vim-easymotion' # {{{2
  Plug 'ZSaberLv0/vim-easymotion-chs'
  # 智能大小写
  g:EasyMotion_smartcase = 1
  # 禁用默认映射
  g:EasyMotion_do_mapping = 0
  map  <Leader><Leader>f  <Plug>(easymotion-bd-f)
  map  <Leader><Leader>F  <Plug>(easymotion-bd-f)
  map  <Leader><Leader>t  <Plug>(easymotion-bd-t)
  map  <Leader><Leader>T  <Plug>(easymotion-bd-t)

# 编辑 {{{1
Plug 'tpope/vim-endwise' # => 轻量结尾补全 {{{2

Plug 'mattn/emmet-vim' # => html/css {{{2
  # 使用<Tab>键
  g:user_emmet_expandabbr_key = '<Tab>'
  # 按文件加载
  g:user_emmet_install_global = 0
  autocmd FileType xml,html,javascriptreact,typescriptreact,css,sass,less EmmetInstall

Plug 'kana/vim-arpeggio' # => 允许同时按键的映射 {{{2
  plug#load('vim-arpeggio')  # 立刻加载
  Arpeggio inoremap jk <Esc>
  Arpeggio nnoremap io  :

# 样式 {{{1
Plug 'sainnhe/everforest' # => 色彩方案 {{{2

Plug 'machakann/vim-highlightedyank' # => 复制高亮 {{{2
  if !exists('##TextYankPost')
    nmap y <Plug>(highlightedyank)
    xmap y <Plug>(highlightedyank)
    omap y <Plug>(highlightedyank)
  endif
  g:highlightedyank_highlight_duration = 2000
