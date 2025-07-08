" PlugVim加载插件
call plug#begin(g:vimdir . '/plugged')
LoadVim vim/plugins/basic.vim
LoadVim vim/plugins/filetree.vim
LoadVim vim/plugins/git.vim
LoadVim vim/plugins/beauty.vim
if !has('nvim')
    LoadVim vim/plugins/fuzzy.vim
    LoadVim vim/plugins/coc.vim
endif
LoadVim vim/plugins/languages.vim
call plug#end()
