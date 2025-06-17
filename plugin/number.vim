" <Leader>j <Leader>k <Leader>gg <Leader>G开启
" 后续输入`asdfghjkl;'"`对应`1234567890-+`
" <Space>或<CR>确认
" <Esc>或q取消
"
if v:version < 800
  finish
endif
let g:numbers = {';': 0, 'a': 1, 's': 2, 'd': 3, 'f': 4, 'g': 5, 'h': 6, 'j': 7, 'k': 8, 'l': 9}
function! Number(x) 
    let s:chars = ''
    while v:true
        call NumberColorHighlightPrint(a:x, s:chars)
        let s:char = getcharstr() 
        if s:char ==# "\<Space>" || s:char == "\<CR>"
            break
        elseif s:char ==# "\<Backspace>" || s:char ==# "\<C-H>"
            if !empty(s:chars)
                let s:chars = s:chars[:-2]
            endif
        elseif s:char ==# "\<C-W>" || s:char ==# "\<C-U>"
            let s:chars = ''
        elseif s:char ==# "\<Esc>" || s:char == 'q'
            echo ''
            call NumberColorClear()
            return
        elseif s:char ==# "\<Up>"
            if empty(s:chars) || s:chars[len(s:chars) - 1] ==# '-' || s:chars[len(s:chars) - 1] ==# '+'
                let s:chars = s:chars .. '1'
            endif
            if a:x == 'k'
                let s:chars = s:chars .. '+'
            else
                let s:chars = s:chars .. '-'
            endif
        elseif s:char ==# "\<Down>"
            if empty(s:chars) || s:chars[len(s:chars) - 1] ==# '-' || s:chars[len(s:chars) - 1] ==# '+'
                let s:chars = s:chars .. '1'
            endif
            if a:x == 'k'
                let s:chars = s:chars .. '-'
            else
                let s:chars = s:chars .. '+'
            endif
        elseif s:char =~# '^[' .. join(keys(g:numbers), '') .. ']$'
            let s:chars = s:chars .. g:numbers[s:char]
        elseif s:char =~# '^[0123456789]'
            let s:chars = s:chars .. s:char
        elseif s:char ==# "\'" || s:char ==# '-'
            if s:chars[len(s:chars) - 1] ==# '-' || s:chars[len(s:chars) - 1] ==# '+'
                let s:chars = s:chars .. '1'
            endif
            let s:chars = s:chars .. '-'
        elseif s:char ==# "\"" || s:char ==# '+'
            if s:chars[len(s:chars) - 1] ==# '-' || s:chars[len(s:chars) - 1] ==# '+'
                let s:chars = s:chars . '1'
            endif
            let s:chars = s:chars . '+'
        endif
    endwhile
    let s:result = CalculateNumber(s:chars)
    execute 'normal! ' .. s:result .. a:x
    call NumberColorClear()
    echo ''
endfunction
function! CalculateNumber(chars)
    let s:result = 0
    if empty(a:chars)
        let s:result = 0
    elseif a:chars[len(a:chars) - 1] ==# '-'
        let s:result = eval(a:chars .. '1')
    elseif a:chars[len(a:chars) - 1] ==# '+'
        let s:result = eval(a:chars .. '1')
    else
        let s:result = eval(a:chars)
    endif
    if s:result ==# 0
        let s:result = 1
    endif
    if s:result < 0
        return 1
    else
        return s:result
    endif
endfunction
function! NumberColorHighlightPrint(x, chars)
    let s:result = CalculateNumber(a:chars)
    echo ' Number: ' .. s:result .. a:x .. ' <-- ' .. a:chars 
    call NumberColorClear()
    if a:x ==# 'j' 
        let s:result = line('.') + s:result
    elseif a:x ==# 'k'
        let s:result = line ('.')- s:result
    endif
    call NumberColorHighlight(s:result)
endfunction
nnoremap <silent> <Leader>j <CMD>call Number('j')<CR>
nnoremap <silent> <Leader>k <CMD>call Number('k')<CR>
nnoremap <silent> <Leader>gg <CMD>call Number('gg')<CR>
nnoremap <silent> <Leader>G <CMD>call Number('G')<CR>
onoremap <silent> <Leader>j V<CMD>call Number('j')<CR>
onoremap <silent> <Leader>k V<CMD>call Number('k')<CR>
onoremap <silent> <Leader>gg V<CMD>call Number('gg')<CR>
onoremap <silent> <Leader>G V<CMD>call Number('G')<CR>


function! NumberColor()
  highlight NumberColor term=reverse,bold cterm=reverse,bold gui=reverse,bold
endfunction
call NumberColor()
autocmd ColorScheme * call NumberColor()
let s:id = 0
let s:winid = 0
function! NumberColorClear()
    if s:id > 0
        let s:id = matchdelete(s:id, s:winid)
        :redraw
        let s:id = 0
    endif
    return ''
endfunction

" augroup fFtTHighlight | autocmd!
    " autocmd CursorMoved,ModeChanged,TextChanged,WinEnter,WinLeave,CmdWinLeave,SafeState * call HighlightClear()
" augroup END

function! NumberColorHighlight(column)
    if s:id > 0
        let s:id = matchdelete(s:id, s:winid)
    endif
    let s:winid = win_getid()
    let s:id = matchaddpos('FfTtColor', [ a:column ], 1002)
    :redraw
endfunction
