let g:vimrc_home = fnamemodify(resolve(expand('<sfile>:p')), ':h')
let g:vimrc_home = substitute(g:vimrc_home, '\', '/', 'g')
source <sfile>:h/autoload/plug.vim
" 加载默认配置
source <sfile>:h/vim/configs/config_example.vim
if filereadable(g:vimrc_home.'/vim/configs/config.vim')
  " 加载自定义配置
  source <sfile>:h/vim/configs/config.vim
endif

" 加载基础配置(set)
source <sfile>:h/vim/setting.vim
" 加载映射(map)
source <sfile>:h/vim/mapping.vim
" 加载vim的配置
source <sfile>:h/vim/vim.vim
" 加载vim插件(vim-plug)
source <sfile>:h/vim/vim.plugin.vim
