" neovim的init.vim引入此文件
"
" source ~/vimfiles/init.vim
"

execute 'set runtimepath^='.expand('<sfile>:p:h')
execute 'set runtimepath+='.expand('<sfile>:p:h').'after'
let &packpath = &runtimepath
source <sfile>:h/vimrc
