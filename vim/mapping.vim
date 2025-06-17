noremap  <Leader>  <Nop>
" 1. 基础映射 {{{1
" 1.1 更符合逻辑的映射 {{{2
map Y y$
" 1.1 删除不进入缓存 {{{2
noremap  s  "_s
noremap  S  "_S
noremap  x  "_x
noremap  X  "_X
noremap <Leader>c "_c
noremap <Leader>C "_C
noremap <Leader>d "_d
noremap <Leader>D "_D
" 1.2 水平移动时保留光标 {{{2
xnoremap  <  <gv
xnoremap  >  >gv
" 1.3 方向键与Esc键  {{{2
if g:config_keyboard == 0
    noremap <C-H>  <Left>|inoremap <C-H>  <Left>|cnoremap <C-H>  <Left>
    noremap <C-J>  <Down>|inoremap <C-J>  <Down>|cnoremap <C-J>  <Down>
    noremap <C-K>    <Up>|inoremap <C-K>    <Up>|cnoremap <C-K>    <Up>
    noremap <C-L> <Right>|inoremap <C-L> <Right>|cnoremap <C-L> <Right>
    inoremap  jk  <Esc>
    inoremap  jj  j
endif
" 1.4 不常用的HLM键  {{{2
noremap  H  ^
noremap  L  $
noremap  M  %
" 1.5 命令行模式 与Shell保持一致  {{{2
cnoremap  <C-A>  <Home>
if has('terminal')
    tnoremap  <C-A>  <Home>
    tnoremap  <C-E>  <End>
endif

" 2. 额外功能  {{{1
" 2.1 可视模式直接搜索当前选择内容  {{{2
xnoremap  <silent> /  <CMD>let @/=VisualSelection()<CR><CMD>set hls<CR>
" 2.2 取消搜索高亮 {{{2
nnoremap  <silent> <Leader>/  <Esc>:<C-U>noh<CR>
function! VisualSelection() " {{{3
    " 先保存寄存器的状态
    let unnamed_reg_data = getreg('"')
    let unnamed_reg_type = getregtype('"')
    " 执行 "y" 命令来复制选中的文本到默认寄存器中
    normal! y
    " 获取默认寄存器的内容，即选中的文本
    let selection = getreg('"')
    " 恢复寄存器的状态
    call setreg('"', unnamed_reg_data, unnamed_reg_type)
    call setreg('*', unnamed_reg_data, unnamed_reg_type)
    " 返回选中的文本
    return selection
endfunction
