" neovim启动文件(~/AppData/Local/nvim/init.vim)引入此文件
"
" source THIS_DIR/init.vim
"
let $MYVIMRC = substitute(expand('<sfile>'), '\', '/', 'g')
let $MYVIMDIR = fnamemodify($MYVIMRC, ':h')

execute 'set runtimepath+='.$MYVIMDIR
let &packpath = &runtimepath

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
" 加载neovim的配置
luafile <sfile>:h/lua/neovim.lua
if exists('g:neovide')
  " 加载neovide的配置
  luafile <sfile>:h/lua/neovide.lua
endif
" 加载neovim插件(lazy.nvim)
luafile <sfile>:h/lua/lazy.nvim.lua
