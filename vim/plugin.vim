" PlugVim加载插件
function! Cond(cond, ...)
    let opts = get(a:000, 0, {})
    return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction
call plug#begin(g:vimdir . '/plugged')
LoadVim vim/plugins/basic.vim
LoadVim vim/plugins/filetree.vim
LoadVim vim/plugins/git.vim
LoadVim vim/plugins/beauty.vim
LoadVim vim/plugins/fuzzy.vim
LoadVim vim/plugins/coc.vim
LoadVim vim/plugins/languages.vim
call plug#end()
