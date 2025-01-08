" telescope.nvim
" 查找文件?

" Find files using Telescope command-line sugar.
nnoremap <Leader>ff <Cmd>Telescope find_files<CR>
nnoremap <Leader>fg <Cmd>Telescope live_grep<CR>
nnoremap <Leader>fb <Cmd>Telescope buffers<CR>
nnoremap <Leader>fh <Cmd>Telescope help_tags<CR>

" Using Lua functions
nnoremap <Leader>ff <Cmd>lua require('telescope.builtin').find_files()<CR>
nnoremap <Leader>fg <Cmd>lua require('telescope.builtin').live_grep()<CR>
nnoremap <Leader>fb <Cmd>lua require('telescope.builtin').buffers()<CR>
nnoremap <Leader>fh <Cmd>lua require('telescope.builtin').help_tags()<CR>
