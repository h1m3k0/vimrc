" NERDTree


" 切换目录时自动切换vim根目录
let NERDTreeChDirMode = 2


nnoremap  <Leader>e   <Esc>:<C-U>NERDTree
nnoremap  <Leader>ef  <Esc>:<C-U>NERDTreeFind<CR>
nnoremap  <Leader>et  <Esc>:<C-U>NERDTreeToggle<CR>
nnoremap  <Leader>ev  <Esc>:<C-U>NERDTree $MYVIMDIR<CR>
nnoremap  <Leader>eh  <Esc>:<C-U>NERDTree $HOME<CR>
