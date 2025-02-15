" PlugVim加载插件
call plug#begin(g:vimrc_home.'/plugged')
execute 'source '.g:vimrc_home.'/vim/plugins/light.vim'
if !g:light
  execute 'source '.g:vimrc_home.'/vim/plugins/beauty.vim'
  execute 'source '.g:vimrc_home.'/vim/plugins/useless.vim'
  execute 'source '.g:vimrc_home.'/vim/plugins/integration.vim'
  execute 'source '.g:vimrc_home.'/vim/plugins/vim9.vim'
endif
call plug#end()
try
  if has('termguicolors')
    colorscheme everforest
  else
    colorscheme onedark
  endif
catch
  colorscheme habamax
endtry
