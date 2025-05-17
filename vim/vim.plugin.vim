" PlugVim加载插件
call plug#begin(g:vimdir .. '/plugged')
LoadScript vim/plugins/light.vim
LoadScript vim/plugins/extend.vim
LoadScript vim/plugins/beauty.vim
LoadScript vim/plugins/todo.vim
LoadScript vim/plugins/fzf.vim.vim
LoadScript vim/plugins/coc.nvim.vim
call plug#end()
