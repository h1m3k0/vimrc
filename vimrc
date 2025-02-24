vim9script
$MYVIMRC  = resolve(expand('<sfile>:p'))
$MYVIMDIR = fnamemodify(resolve(expand('<sfile>:p')), ':h')
$MYVIMDIR = substitute($MYVIMDIR, '\', '/', 'g')
command! -nargs=1 LoadScript execute 'source ' .. $MYVIMDIR .. '/' .. '<args>'
execute 'set runtimepath+=' .. $MYVIMDIR
# 加载默认配置
LoadScript vim/configs/config_example.vim
if filereadable($MYVIMDIR .. '/vim/configs/config.vim')
  # 加载自定义配置
  LoadScript vim/configs/config.vim
endif

# 加载基础配置(set)
LoadScript vim/setting.vim
# 加载映射(map)
LoadScript vim/mapping.vim
# 加载vim的配置
LoadScript vim/vim.vim
# 加载vim插件(vim-plug)
LoadScript vim/vim.plugin.vim
# 最后处理的事情
LoadScript vim/finally.vim
