" vim启动文件(~/vimfiles/vimrc)引入此文件
"
" source THIS_DIR/vimrc
"

let $MYVIMRC = substitute(expand('<sfile>'), '\', '/', 'g')
let $MYVIMDIR = fnamemodify($MYVIMRC, ':h')

source <sfile>:h/autoload/plug.vim
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
" 加载vim插件(vim-plug)
source <sfile>:h/vim/vim.plugin.vim
