" """"""""""""""""""""""""""
" """" 插件加载后的配置(顺序: 2)
" """"""""""""""""""""""""""
" colorscheme
try
  colorscheme onedark
  set background=dark
catch
endtry

" << NERDTree >>
nnoremap  <leader>nn  <esc>:<c-u>NERDTree
nnoremap  <leader>nf  <esc>:<c-u>NERDTreeFind<cr>
nnoremap  <leader>nt  <esc>:<c-u>NERDTreeToggle<cr>

" << EasyMotion >>
map  <leader>f  <Plug>(easymotion-bd-f)
map  <leader>t  <Plug>(easymotion-bd-t)

" << quickscope >>
" 禁止操作符等待时高亮
onoremap  f  f
onoremap  F  F
onoremap  t  t
onoremap  T  T

" << fzf >>
" 映射搜索
command!  Nmaps  call  fzf#vim#maps('n', 0)
command!  Imaps  call  fzf#vim#maps('i', 0)
command!  Cmaps  call  fzf#vim#maps('c', 0)
command!  Vmaps  call  fzf#vim#maps('v', 0)
command!  Xmaps  call  fzf#vim#maps('x', 0)
command!  Smaps  call  fzf#vim#maps('s', 0)
command!  Omaps  call  fzf#vim#maps('o', 0)
command!  Tmaps  call  fzf#vim#maps('t', 0)
command!  Lmaps  call  fzf#vim#maps('l', 0)
