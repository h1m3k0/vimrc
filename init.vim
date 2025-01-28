" neovim的init.vim引入此文件
"
" source ~/vimfiles/init.vim
"

execute 'set runtimepath+='.expand('<sfile>:p:h')
let &packpath = &runtimepath
source <sfile>:h/vimrc
