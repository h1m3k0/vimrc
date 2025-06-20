let g:vimdir = fnamemodify(resolve(expand('<sfile>:p')), ':h')
let g:vimdir = substitute(g:vimdir, '\v^([a-z]):([\/])', '\u\1:\2', '')
let g:vimdir = substitute(g:vimdir, '\', '/', 'g')
let g:vimrc = g:vimdir . '/vimrc'

command! -nargs=1 LoadVim execute 'source ' . g:vimdir . '/' . '<args>'
command! -nargs=1 LoadLua execute 'luafile ' . g:vimdir . '/' . '<args>'

execute 'set runtimepath+=' . g:vimdir
let &packpath = &runtimepath

" 优先加载
LoadVim vim/configs/1_example.vim

" 加载基础配置(set)
LoadVim vim/setting.vim
" 加载映射(map)
LoadVim vim/mapping.vim
" 加载vim的配置
LoadVim vim/vim.vim
if !has('nvim')
    " 加载vim插件(vim-plug)
    LoadVim vim/plugin.vim
endif
if has('nvim')
    " 加载neovim的配置
    LoadLua lua/neovim.lua
    if exists('g:neovide')
        " 加载neovide的配置
        LoadLua lua/neovide.lua
    endif
    " 加载neovim插件(lazy.nvim)
    LoadLua lua/lazy.nvim.lua
endif

" 最后加载
LoadVim vim/configs/9_example.vim
