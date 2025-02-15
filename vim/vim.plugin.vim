" PlugVim加载插件
call plug#begin(g:vimrc_home.'/plugged')
execute 'source '.g:vimrc_home.'/vim/plugins/light.vim'
execute 'source '.g:vimrc_home.'/vim/plugins/colorscheme.vim'
execute 'source '.g:vimrc_home.'/vim/plugins/beauty.vim'
Plug 'terryma/vim-multiple-cursors'     " 多光标
Plug 'tommcdo/vim-exchange'             " 互换操作
Plug 'junegunn/vim-peekaboo'
" 中文文档
Plug 'yianwillis/vimcdoc'
" 主题色
Plug 'mattn/emmet-vim'                  " html/css
Plug 'Xuyuanp/nerdtree-git-plugin'      " NERDTree+Git
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Donaldttt/fuzzyy'
Plug 'girishji/vimbits'
let g:vimbits_highlightonyank = v:false
let g:vimbits_easyjump = v:false
let g:vimbits_fFtT = v:true
let g:vimbits_vim9cmdline = v:false
call plug#end()

" colorscheme {{{
try
  if has('termguicolors')
    colorscheme everforest
  else
    colorscheme onedark
  endif
catch
  colorscheme habamax
endtry
" }}}

for name in g:plugs_order
  if has_key(g:plugs, name) && isdirectory(g:plugs[name].dir) 
    if filereadable(g:vimrc_home.'/vim/plugins/'.name.'.vim')
      execute 'source '.g:vimrc_home.'/vim/plugins/'.name.'.vim'
    endif
  endif
endfor
