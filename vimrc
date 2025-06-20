let g:vimrc  = resolve(expand('<sfile>:p'))
let g:vimdir = fnamemodify(resolve(expand('<sfile>:p')), ':h')
let g:vimdir = substitute(g:vimdir, '\', '/', 'g')
command! -nargs=1 LoadScript execute 'source ' . g:vimdir . '/' . '<args>'
execute 'set runtimepath+=' . g:vimdir

" 优先加载
LoadScript vim/configs/1_example.vim

" 加载基础配置(set)
LoadScript vim/setting.vim
" 加载映射(map)
LoadScript vim/mapping.vim
" 加载vim的配置
LoadScript vim/vim.vim
" 加载vim插件(vim-plug)
LoadScript vim/plugin.vim

" 最后加载
LoadScript vim/configs/9_example.vim
