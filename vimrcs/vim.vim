" vim配置


" 上移下移
nnoremap <silent> <C-S-Up>   <Esc>:<C-U>m-2<CR>
nnoremap <silent> <C-S-Down> <Esc>:<C-U>m+<CR>
xnoremap <silent> <C-S-Up>   :m '<-2<CR>gv=gv
xnoremap <silent> <C-S-Down> :m '>+<CR>gv=gv
