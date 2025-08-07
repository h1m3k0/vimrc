" PlugVim加载插件
function! Plug(repo, cond, ...)
    let opts = get(a:000, 0, {})
    call plug#(a:repo, a:cond ? opts : extend(opts, { 'on': [], 'for': [] }))
    return a:cond
endfunction
command! -nargs=+ -bar PlugIf call Plug(<args>)

call plug#begin(g:vimdir . '/plugged')
LoadVim vim/plugins/basic.vim
LoadVim vim/plugins/filetree.vim
LoadVim vim/plugins/git.vim
LoadVim vim/plugins/beauty.vim
LoadVim vim/plugins/fuzzy.vim
LoadVim vim/plugins/coc.vim
LoadVim vim/plugins/languages.vim
call plug#end()

delcommand PlugIf
