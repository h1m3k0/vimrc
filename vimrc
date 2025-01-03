" 载入默认配置
source <sfile>:h/vimrcs/config/config_example.vim
try
  " 载入自定义配置, 允许文件不存在
  source <sfile>:h/vimrcs/config/config.vim
catch
endtry
" 载入基础配置(set)
source <sfile>:h/vimrcs/setting.vim
" 载入映射(map)
source <sfile>:h/vimrcs/mapping.vim
" 载入插件(PlugVim)
source <sfile>:h/vimrcs/vim.plugin.vim
" 载入vim配置
source <sfile>:h/vimrcs/vim.vim
for [name, plug] in items(g:plugs)
    if isdirectory(plug.dir)
      try
        " 载入插件配置, 允许文件不存在
        execute 'source <sfile>:h/vimrcs/plugin/'.name.'.vim'
      catch
      endtry
    endif
endfor
