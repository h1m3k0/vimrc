" PlugVim加载插件
call plug#begin(g:vimrc_home.'/plugged')
LoadScript vim/plugins/light.vim
if !g:light
  LoadScript vim/plugins/extend.vim
  LoadScript vim/plugins/beauty.vim
  LoadScript vim/plugins/todo.vim
endif
call plug#end()
