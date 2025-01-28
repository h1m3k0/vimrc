let $MYVIMRC = substitute(expand('<sfile>'), '\', '/', 'g')
let $MYVIMDIR = fnamemodify($MYVIMRC, ':h')

" 加载默认配置
source <sfile>:h/vim/configs/config_example.vim
if filereadable($MYVIMDIR.'/vim/configs/config.vim')
  " 加载自定义配置
  source <sfile>:h/vim/configs/config.vim
endif

" 加载基础配置(set)
source <sfile>:h/vim/setting.vim
" 加载映射(map)
source <sfile>:h/vim/mapping.vim
" 加载vim的配置
source <sfile>:h/vim/vim.vim
if has('nvim')
  " 加载neovim的配置
  luafile <sfile>:h/lua/neovim.lua
  if exists(g:neovide)
    " 加载neovide的配置
    luafile <sfile>:h/lua/neovide.lua
  endif
  " 加载neovim插件(lazy.nvim)
  luafile <sfile>:h/lua/lazy.nvim.lua
else
  " 加载vim插件(vim-plug)
  source <sfile>:h/vim/vim.plugin.vim
endif
