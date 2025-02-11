" PlugVim加载插件
let g:plug_url_format = g:config_github
call plug#begin($MYVIMDIR.'/local/vim-plug/plugins')
" IdeaVim支持的插件
Plug 'easymotion/vim-easymotion'        " 快速跳转 [motions]
Plug 'preservim/nerdtree'               " 文件树
Plug 'tpope/vim-surround'               " 环绕操作
Plug 'terryma/vim-multiple-cursors'     " 多光标
Plug 'tpope/vim-commentary'             " 注释操作
Plug 'vim-scripts/ReplaceWithRegister'  " 替换操作
Plug 'vim-scripts/argtextobj.vim'       " 参数文本对象
Plug 'tommcdo/vim-exchange'             " 互换操作
Plug 'kana/vim-textobj-entire'          " 全文文本对象
Plug 'machakann/vim-highlightedyank'    " 复制高亮
Plug 'michaeljsmith/vim-indent-object'  " 缩进文本对象 [text-objects] ii当前 ai包含上一行 aI包含上下
Plug 'chrisbra/matchit'                 " 百分号增强
Plug 'unblevable/quick-scope'           " 高亮每个单词中唯一的字符
Plug 'junegunn/vim-peekaboo'


if v:version >= 900
  " 中文文档
  Plug 'yianwillis/vimcdoc'
endif

" 主题色
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'sainnhe/everforest'
Plug 'altercation/vim-colors-solarized'

Plug 'ZSaberLv0/vim-easymotion-chs'     " easymotion中文扩展
Plug 'tpope/vim-repeat'                 " tpope的点扩展
Plug 'jiangmiao/auto-pairs'             " 自动括号
Plug 'kana/vim-textobj-user'            " 自定义文本对象 (vim-textobj-entire前置插件)
Plug 'junegunn/vim-easy-align'          " 对齐 [operator] ga/ga*/ga**
Plug 'mattn/emmet-vim'                  " html/css
Plug 'vim-airline/vim-airline'          " 状态栏
Plug 'vim-airline/vim-airline-themes'   " 状态栏主题
Plug 'mhinz/vim-startify'               " 启动页面
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
    if filereadable($MYVIMDIR.'/vim/plugins/'.name.'.vim')
      execute 'source '.$MYVIMDIR.'/vim/plugins/'.name.'.vim'
    endif
  endif
endfor
