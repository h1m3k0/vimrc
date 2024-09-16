" 映射配置
" ========== 基础映射 开始 ==========
"
" leader键
noremap <leader> <nop>

" s和x删除 => 不进入缓存
noremap  s  "_s
noremap  S  "_S
noremap  x  "_x
noremap  X  "_X

" 水平移动时保留光标
xnoremap <  <gv
xnoremap >  >gv

" @/为空时n/N搜索 => 不报错
if !has('ide')  " ideavim不存在这个问题
    noremap  <silent> n  :call Extension_n('n')<cr>
    noremap  <silent> N  :call Extension_n('N')<cr>
endif

" ---------- 基础映射 结束 ----------

" ========== 功能映射 开始 ==========

" 全模式 方向键
if g:custom_config_keyboard == 0 && g:custom_config_environment == 0
    noremap <c-h>  <left>|inoremap <c-h>  <left>|cnoremap <c-h>  <left>
    noremap <c-j>  <down>|inoremap <c-j>  <down>|cnoremap <c-j>  <down>
    noremap <c-k>    <up>|inoremap <c-k>    <up>|cnoremap <c-k>    <up>
    noremap <c-l> <right>|inoremap <c-l> <right>|cnoremap <c-l> <right>
endif

" Insert模式 jk 退出
if g:custom_config_keyboard == 0
    inoremap  jk  <esc>
    inoremap  jj  j
endif

" 不常用键映射
noremap H ^
noremap L $
map M %

" 可视模式直接搜索当前选择内容
xnoremap  <silent> /  <esc>:call VisualRegSearch()<cr>/<cr>N
xnoremap  <silent> ?  <esc>:call VisualRegSearch()<cr>?<cr>N

" 清空搜索
nnoremap  <silent> <leader>/  <esc>:let @/ = ''<cr>
if has('ide')  " ideavim
    " ideavim需要额外/<esc>, :s匹配后清除需要手动搜索一次
    nnoremap  <leader>/  <esc>:let @/ = ''<cr>/<esc>
endif

" ---------- 功能映射 结束 ----------

" ========== 清除选择模式 开始 ==========
"
smapclear
" ---------- 清除选择模式 结束 ----------


" ========== Function 开始 ==========
"
" vim的n/N搜索
function! Extension_n(n)
    if @/ != '' && ( a:n == 'n' || a:n == 'N' )
        try
            execute 'norm! '.a:n
        catch
        endtry
    endif
endfunction

" 可视模式直接搜索当前选择内容
function! VisualRegSearch()
    let l:temp = @"
    normal! gvy
    let @/ = @"
    let @" = l:temp
endfunction
" ---------- Function 结束 ----------
