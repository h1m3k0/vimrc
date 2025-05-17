function! FfTtColor()
  highlight FfTtColor gui=reverse,bold
endfunction
call FfTtColor()
autocmd ColorScheme * call FfTtColor()
let s:id = 0
let s:winid = 0
function! HighlightClear()
    if s:id > 0
        let s:id = matchdelete(s:id, s:winid)
        :redraw
        let s:id = 0
    endif
    return ''
endfunction

augroup fFtTHighlight | autocmd!
    if v:version >= 8000
        autocmd ModeChanged,CmdWinLeave,SafeState * call HighlightClear()
    endif
    autocmd CursorMoved,TextChanged,WinEnter,WinLeave * call HighlightClear()
augroup END

" Gather locations of characters to be dimmed.
function! HighlightChars(s)
    let [_, lnum, col, _] = getpos('.')
    let line = getline('.')
    " Extended ASCII characters can pose a challenge if we simply iterate over
    " bytes. It is preferable to let Vim split the line by characters for more
    " accurate handling.
    let found = {}
    for ch in split(line, '\zs')
        if !has_key(found, ch)
            let found[ch] = 1
        endif
    endfor

    let [start, reverse] = (a:s =~ '\C[ft]') ? [col, v:false] : [col - 2, v:true]
    let locations = []
    let freq = {}
    let maxloc = max([100, &lines * &columns])
    for ch in keys(found)
        let loc = reverse ? strridx(line, ch, start) : stridx(line, ch, start)
        while loc != -1
            let freq[ch] = get(freq, ch, 0) + 1
            if freq[ch] > maxloc
                " If we encounter a super long line, there's no need to
                " search for locations that are off screen.
                break
            endif
            if freq[ch] == v:count1
                let locations = add(locations, [lnum, loc + 1])
            endif
            let loc = reverse ? strridx(line, ch, loc - 1) : stridx(line, ch, loc + 1)
        endwhile
    endfor

    if !empty(locations)
        if s:id > 0
            let s:id = matchdelete(s:id, s:winid)
        endif
        let s:winid = win_getid()
        let s:id = matchaddpos('FfTtColor', locations, 1001)
        :redraw
    endif
    return ''
endfunction

noremap <silent><expr> <Plug>(fFtT-f) HighlightChars('f')
noremap <silent><expr> <Plug>(fFtT-F) HighlightChars('F')
noremap <silent><expr> <Plug>(fFtT-t) HighlightChars('t')
noremap <silent><expr> <Plug>(fFtT-T) HighlightChars('T')
noremap <silent><expr> <Plug>(fFtT-esc) HighlightClear()

nnoremap f <Plug>(fFtT-f)f
xnoremap f <Plug>(fFtT-f)f
onoremap f <Plug>(fFtT-f)f
nnoremap F <Plug>(fFtT-F)F
xnoremap F <Plug>(fFtT-F)F
onoremap F <Plug>(fFtT-F)F
nnoremap t <Plug>(fFtT-t)t
xnoremap t <Plug>(fFtT-t)t
onoremap t <Plug>(fFtT-t)t
nnoremap T <Plug>(fFtT-T)T
xnoremap T <Plug>(fFtT-T)T
onoremap T <Plug>(fFtT-T)T
