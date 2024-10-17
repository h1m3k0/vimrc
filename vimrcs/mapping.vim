" 映射配置
" ========== 基础映射 开始 ==========
"
" leader键
noremap  <leader>  <nop>

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
    noremap <c-h>  <left>|inoremap <c-h>  <left>|cnoremap <c-h>  <left>
    noremap <c-j>  <down>|inoremap <c-j>  <down>|cnoremap <c-j>  <down>
    noremap <c-k>    <up>|inoremap <c-k>    <up>|cnoremap <c-k>    <up>
    noremap <c-l> <right>|inoremap <c-l> <right>|cnoremap <c-l> <right>
endif

" Insert模式 jk 退出
if g:config_keyboard == 0
    inoremap  jk  <esc>
    inoremap  jj  j
endif

" 不常用键映射
noremap  H  ^
noremap  L  $
map  M  %

" 可视模式直接搜索当前选择内容
xnoremap  <silent> /  <esc>:<c-u>call VisualRegSearch()<cr>/<cr>N
xnoremap  <silent> ?  <esc>:<c-u>call VisualRegSearch()<cr>?<cr>N

" 取消搜索高亮
nnoremap  <silent> <leader>/  <esc>:<c-u>nohlsearch<cr>

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
