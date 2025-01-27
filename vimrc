let $MYVIMRC = substitute(expand('<sfile>'), '\', '/', 'g')
let $MYVIMDIR = fnamemodify($MYVIMRC, ':h')

" 载入默认配置
source <sfile>:h/vim/configs/config_example.vim
if filereadable($MYVIMDIR.'/vim/configs/config.vim')
  " 载入自定义配置
  source <sfile>:h/vim/configs/config.vim
endif

" 载入基础配置(set)
source <sfile>:h/vim/setting.vim
" 载入映射(map)
source <sfile>:h/vim/mapping.vim
" 载入插件
if !has('nvim')
  " vim(vim-plug)
  source <sfile>:h/vim/vim.plugin.vim
else
  " neovim(lazy.nvim)
  luafile <sfile>:h/lua/lazy.nvim.lua
endif
" 载入vim配置
source <sfile>:h/vim/vim.vim
if has('nvim')
  luafile <sfile>:h/lua/neovim.lua
endif
