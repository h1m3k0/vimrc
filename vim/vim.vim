vim9script

# 设置字体
try
  set guifont=JetBrainsMono_NFM:h12
catch
  try
    set guifont=Consolas:h12
  catch
  endtry
endtry

# 上移下移
nnoremap <silent> <C-S-Up>   <Cmd>m--<CR>
nnoremap <silent> <C-S-Down> <Cmd>m+<CR>
xnoremap <silent> <C-S-Up>   :m '<-2<CR>gv=gv
xnoremap <silent> <C-S-Down> :m '>+<CR>gv=gv

# GUI 字体大小
if has('gui_running')
  command! Bigger  let &guifont = substitute(&guifont, '\d\+$', '\=submatch(0)+1', '')
  command! Smaller let &guifont = substitute(&guifont, '\d\+$', '\=submatch(0)-1', '')
endif

# 切换 buffer or tag
nnoremap <silent> <A-Left>  <Cmd>My_PrevPage()<CR>
nnoremap <silent> <A-Right> <Cmd>My_NextPage()<CR>

# next (bp or tabp)
def My_NextPage()
  if tabpagenr('$') == 1
    bnext
  else
    tabnext
  endif
enddef


# prev (bn or tabn)
def My_PrevPage()
  if tabpagenr('$') == 1
    bprevious
  else
    tabprevious
  endif
enddef
