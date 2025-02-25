let $MYVIMDIR = fnamemodify(resolve(expand('<sfile>:p')), ':h')
let $MYVIMDIR = substitute($MYVIMDIR, '\', '/', 'g')
let $MYVIMRC = $MYVIMDIR.'/init.vim'

execute 'set runtimepath+='.$MYVIMDIR
let &packpath = &runtimepath

command! -nargs=1 LoadSource execute 'source ' . $MYVIMDIR . '/' . '<args>'
command! -nargs=1 LoadLuafile execute 'luafile ' . $MYVIMDIR . '/' . '<args>'

" 加载默认配置
LoadSource vim/configs/config_example.vim
if filereadable($MYVIMDIR.'/vim/configs/config.vim')
  " 加载自定义配置
  LoadSource vim/configs/config.vim
endif

" 加载基础配置(set)
LoadSource vim/setting.vim
" 加载映射(map)
LoadSource vim/mapping.vim
" 加载vim的配置
LoadSource vim/vim.vim
" 加载neovim的配置
LoadLuafile lua/neovim.lua
if exists('g:neovide')
  " 加载neovide的配置
  LoadLuafile lua/neovide.lua
endif
" 加载neovim插件(lazy.nvim)
LoadLuafile lua/lazy.nvim.lua
LoadSource plugin/fFtT.vim
