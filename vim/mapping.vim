" 映射配置
" ========== 基础映射 开始 ==========
"
" leader键
noremap  <Leader>  <Nop>

" s和x删除 => 不进入缓存
noremap  s  "_s
noremap  S  "_S
noremap  x  "_x
noremap  X  "_X

" 水平移动时保留光标
xnoremap  <  <gv
xnoremap  >  >gv

" ---------- 基础映射 结束 ----------

" ========== 功能映射 开始 ==========

" 全模式 方向键
if g:config_keyboard == 0 && g:config_environment == 0
    noremap <C-H>  <Left>|inoremap <C-H>  <Left>|cnoremap <C-H>  <Left>
    noremap <C-J>  <Down>|inoremap <C-J>  <Down>|cnoremap <C-J>  <Down>
    noremap <C-K>    <Up>|inoremap <C-K>    <Up>|cnoremap <C-K>    <Up>
    noremap <C-L> <Right>|inoremap <C-L> <Right>|cnoremap <C-L> <Right>
endif

" Insert模式 jk 退出
if g:config_keyboard == 0
    inoremap  jk  <Esc>
    inoremap  jj  j
endif

" 不常用键映射
noremap  H  ^
noremap  L  $
noremap  M  %

" 命令行模式
" NOTE: 与Shell命令行保持一致
cnoremap  <C-A>  <Home>
cnoremap  <C-E>  <End>

" 可视模式直接搜索当前选择内容
xnoremap  <silent> /  <Esc>:<C-U>call VisualRegSearch()<CR>/<CR>N
xnoremap  <silent> ?  <Esc>:<C-U>call VisualRegSearch()<CR>?<CR>N

" 取消搜索高亮
nnoremap  <silent> <Leader>/  <Esc>:<C-U>nohlsearch<CR>

" ---------- 功能映射 结束 ----------

" ========== 清除选择模式 开始 ==========
"
smapclear
" ---------- 清除选择模式 结束 ----------


" ========== Function 开始 ==========

" 可视模式直接搜索当前选择内容
function! VisualRegSearch()
    let l:temp = @"
    normal! gvy
    let @/ = @"
    let @" = l:temp
endfunction
" ---------- Function 结束 ----------
