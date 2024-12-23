""""""""""""""""""""""""""""
"""""" 插件加载后的配置(顺序: 2)
""""""""""""""""""""""""""""
" << EasyMotion >>
map  <Leader>f  <Plug>(easymotion-bd-f)
map  <Leader>F  <Plug>(easymotion-bd-f)
map  <Leader>t  <Plug>(easymotion-bd-t)
map  <Leader>T  <Plug>(easymotion-bd-t)

" << NERDTree >>
nnoremap  <Leader>nn  <Esc>:<C-u>NERDTree 
nnoremap  <Leader>nf  <Esc>:<C-u>NERDTreeFind<CR>
nnoremap  <Leader>nt  <Esc>:<C-u>NERDTreeToggle<CR>

" << quickscope >>
" 禁止操作符等待时高亮
onoremap  f  f
onoremap  F  F
onoremap  t  t
onoremap  T  T

" << easy-align >>
nmap  ga  <Plug>(EasyAlign)
xmap  ga  <Plug>(EasyAlign)
