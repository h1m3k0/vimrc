vim9script
# PlugVim加载插件
plug#begin($MYVIMDIR .. '/plugged')
LoadScript vim/plugins/light.vim
LoadScript vim/plugins/extend.vim
LoadScript vim/plugins/beauty.vim
LoadScript vim/plugins/todo.vim
LoadScript vim/plugins/coc.nvim.vim
plug#end()
