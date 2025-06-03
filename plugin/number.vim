" <Leader>j <Leader>k <Leader>gg <Leader>G开启
" 后续输入`asdfghjkl;'"`对应`1234567890-+`
" <Space>或<CR>确认
" <Esc>或q取消
let g:numbers = {';': 0, 'a': 1, 's': 2, 'd': 3, 'f': 4, 'g': 5, 'h': 6, 'j': 7, 'k': 8, 'l': 9}
function! Number(x) 
    echo 'Number ' . a:x . ': '
    let s:chars = ''
    while v:true
        let s:char = getcharstr() 
        if s:char ==# "\<Space>" || s:char == "\<CR>"
            break
        endif
        if s:char ==# "\<Backspace>" || s:char ==# "\<C-H>"
            if !empty(s:chars)
                let s:chars = s:chars[:-2]
            endif
        endif
        if s:char ==# "\<C-W>" || s:char ==# "\<C-U>"
            let s:chars = ''
        endif
        if s:char ==# "\<Esc>" || s:char == 'q'
            echo ''
            redraw
            return
        endif
        if s:char =~# '^[' . join(keys(g:numbers), '') . ']$'
            let s:chars = s:chars . g:numbers[s:char]
        elseif s:char =~# '^[0123456789]'
            let s:chars = s:chars . s:char
        endif
        if s:char ==# "\'" || s:char ==# '-'
            let s:chars = s:chars . '-'
        endif
        if s:char ==# "\"" || s:char ==# '+'
            let s:chars = s:chars . '+'
        endif
        redraw
        echo 'Number ' . a:x . ':' s:chars
    endwhile
    let s:result = eval(s:chars)
    execute 'normal! '. s:result . a:x 
    redraw
endfunction
noremap <silent> <Leader>j <CMD>call Number('j')<CR>
noremap <silent> <Leader>k <CMD>call Number('k')<CR>
noremap <silent> <Leader>gg <CMD>call Number('gg')<CR>
noremap <silent> <Leader>G <CMD>call Number('G')<CR>
