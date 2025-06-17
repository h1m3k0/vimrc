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

let g:fast_cmd = 0
" FastCmd {{{2
function! FastCmd(bang, line1, line2, cmd) range
    let g:fast_cmd = 1
    " 保存当前设置(如果有其他影响的配置项, 需要补充)
    let runtimepath = &runtimepath
    let eventignore = &eventignore
    let filetype = &filetype
    let indentexpr = &indentexpr
    let foldmethod = &foldmethod
    let clipboard = &clipboard
    " auto-pairs 
    let autopairs_enabled = b:autopairs_enabled

    " 清空设置
    set runtimepath=
    set eventignore=all
    set filetype=
    set indentexpr=
    set foldmethod=manual
    set clipboard=
    let b:autopairs_enabled = v:false

    try
        " 执行命令
        execute 'noautocmd ' . a:line1 . ',' . a:line2 .
                    \ 'normal' . (a:bang ? '! ' : ' ') . a:cmd
    finally
        let g:fast_cmd = 0
        " 恢复设置
        let &runtimepath = l:runtimepath
        let &eventignore = l:eventignore
        let &filetype = l:filetype
        let &indentexpr = l:indentexpr
        let &foldmethod = l:foldmethod
        let &clipboard = l:clipboard
        let b:autopairs_enabled = autopairs_enabled
        " 强制重载文件类型
        if l:filetype != ''
            silent! doautocmd FileType
        endif
    endtry
endfunction

" FastCmd 命令
command! -bang -range -nargs=* FastCmd call FastCmd(<bang>0, <line1>, <line2>, <q-args>)
