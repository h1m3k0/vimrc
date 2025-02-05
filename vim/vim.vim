" vim配置


" 上移下移
nnoremap <silent> <C-S-Up>   <Esc>:<C-U>m-2<CR>
nnoremap <silent> <C-S-Down> <Esc>:<C-U>m+<CR>
xnoremap <silent> <C-S-Up>   :m '<-2<CR>gv=gv
xnoremap <silent> <C-S-Down> :m '>+<CR>gv=gv

" GUI 字体大小
if has('gui_running')
  command! Bigger  let &guifont = substitute(&guifont, '\d\+$', '\=submatch(0)+1', '')
  command! Smaller let &guifont = substitute(&guifont, '\d\+$', '\=submatch(0)-1', '')
endif

nnoremap <silent> <A-Left>  <Esc>:<C-U>bprevious<CR>
nnoremap <silent> <A-Right> <Esc>:<C-U>bnext<CR>
