source <sfile>:h/autoload/plug.vim
" 载入默认配置
source <sfile>:h/vimrcs/config/config_example.vim
if filereadable(expand('<sfile>:p:h').'vimrcs/config/config.vim')
  " 载入自定义配置
  source <sfile>:h/vimrcs/config/config.vim
endif

" 载入基础配置(set)
source <sfile>:h/vimrcs/setting.vim
" 载入映射(map)
source <sfile>:h/vimrcs/mapping.vim
" 载入插件(PlugVim)
source <sfile>:h/vimrcs/vim.plugin.vim
" 载入vim配置
source <sfile>:h/vimrcs/vim.vim
