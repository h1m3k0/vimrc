" 设置字体 {{{2
if has('gui_running')
  try
    set guifont=JetBrainsMono_NFM:h12
  catch
    try
      set guifont=Consolas:h12
    catch
    endtry
  endtry
endif

" 上移下移 {{{2
nnoremap <silent> <C-S-Up>   <Cmd>m--<CR>
nnoremap <silent> <C-S-Down> <Cmd>m+<CR>
xnoremap <silent> <C-S-Up>   :m '<--<CR>gv=gv
xnoremap <silent> <C-S-Down> :m '>+<CR>gv=gv

" GUI 字体大小 {{{2
if has('gui_running')
  command! Bigger  let &guifont = substitute(&guifont, '\d\+$', '\=submatch(0)+1', '')
  command! Smaller let &guifont = substitute(&guifont, '\d\+$', '\=submatch(0)-1', '')
endif

" 切换 buffer or tag {{{2
nnoremap <silent> <A-Left>  <Esc>:<C-U>call My_PrevPage()<CR>
nnoremap <silent> <A-Right> <Esc>:<C-U>call My_NextPage()<CR>
function! My_NextPage() " {{{3
  if tabpagenr('$') == 1
    bnext
  else
    tabnext
  endif
endfunction

function! My_PrevPage() " {{{3
  if tabpagenr('$') == 1
    bprevious
  else
    tabprevious
  endif
endfunction
