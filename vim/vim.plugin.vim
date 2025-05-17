" PlugVim加载插件
call plug#begin(g:vimdir . '/plugged')
LoadScript vim/plugins/vim7.vim
LoadScript vim/plugins/beauty.vim
LoadScript vim/plugins/fzf.vim
LoadScript vim/plugins/coc.vim
if v:version >= 800
    LoadScript vim/plugins/vim8.vim
endif
call plug#end()
