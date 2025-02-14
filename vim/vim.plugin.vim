" PlugVim加载插件
call plug#begin(g:vimrc_home.'/plugged')
source g:vimrc_home.'/vim/plugins/light.vim'
Plug 'easymotion/vim-easymotion'        " 快速跳转 [motions]
Plug 'terryma/vim-multiple-cursors'     " 多光标
Plug 'tommcdo/vim-exchange'             " 互换操作
Plug 'junegunn/vim-peekaboo'
" 中文文档
Plug 'yianwillis/vimcdoc'
" 主题色
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }

Plug 'ZSaberLv0/vim-easymotion-chs'     " easymotion中文扩展
Plug 'junegunn/vim-easy-align'          " 对齐 [operator] ga/ga*/ga**
Plug 'mattn/emmet-vim'                  " html/css
Plug 'Xuyuanp/nerdtree-git-plugin'      " NERDTree+Git
Plug 'ryanoasis/vim-devicons'           " 图标
Plug 'vim-airline/vim-airline'          " 状态栏
Plug 'vim-airline/vim-airline-themes'   " 状态栏主题
Plug 'mhinz/vim-startify'               " 启动页面
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Donaldttt/fuzzyy'
Plug 'girishji/vimbits'
let g:vimbits_fFtT = v:true
call plug#end()


try
  if has('termguicolors')
    colorscheme everforest
  else
    colorscheme onedark
  endif
catch
endtry

for name in g:plugs_order
  if has_key(g:plugs, name) && isdirectory(g:plugs[name].dir) 
    if filereadable(g:vimrc_home.'/vim/plugins/'.name.'.vim')
      execute 'source '.g:vimrc_home.'/vim/plugins/'.name.'.vim'
    endif
  endif
endfor
