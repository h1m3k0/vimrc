" 设置字体 {{{2
if has('gui_running')
    try
        set guifont=JetBrainsMonoNL_NFM:h12
    catch
        try
            set guifont=Consolas:h12
        catch
        endtry
    endtry
endif

" 上移下移 {{{2
nnoremap <silent> <C-S-Up>   <Esc>:<C-U>m--<CR>
nnoremap <silent> <C-S-Down> <Esc>:<C-U>m+<CR>
xnoremap <silent> <C-S-Up>   :m '<--<CR>gv=gv
xnoremap <silent> <C-S-Down> :m '>+<CR>gv=gv

" 切换 buffer or tag {{{2
nnoremap <silent> <A-Left>  <Esc>:<C-U>call GotoPrevPage()<CR>
nnoremap <silent> <A-Right> <Esc>:<C-U>call GotoNextPage()<CR>
function! GotoNextPage() " {{{3
    if tabpagenr('$') == 1
        bnext
    else
        tabnext
    endif
endfunction

function! GotoPrevPage() " {{{3
    if tabpagenr('$') == 1
        bprevious
    else
        tabprevious
    endif
endfunction

" Terminal
nnoremap <Leader>t <CMD>botright terminal ++rows=5<CR>

" GUI command {{{2
if has('gui_running')
    " 调大字体
    command! GuiFontBigger  let &guifont = substitute(&guifont, '\d\+$', '\=str2nr(submatch(0)) + 1', '')
    " 调小字体
    command! GuiFontSmaller let &guifont = substitute(&guifont, '\d\+$', '\=str2nr(submatch(0)) - 1', '')
    " 全屏
    command! GuiFullScreen simalt ~x
endif