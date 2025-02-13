" vim配置

" 设置字体
try
  set guifont=CaskaydiaMono_NFM:h12
catch
  try
    set guifont=Consolas:h12
  catch
  endtry
endtry

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

" 切换 buffer or tag
nnoremap <silent> <A-Left>  <Esc>:<C-U>call My_PrevPage()<CR>
nnoremap <silent> <A-Right> <Esc>:<C-U>call My_NextPage()<CR>

" next (bp or tabp)
function! My_NextPage()
  if tabpagenr('$') == 1
    bnext
  else
    tabnext
  endif
endfunction

" prev (bn or tabn)
function! g:My_PrevPage()
  if tabpagenr('$') == 1
    bprevious
  else
    tabprevious
  endif
endfunction
