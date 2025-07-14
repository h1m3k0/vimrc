Plug 'editorconfig/editorconfig-vim' " editorconfig

Plug 'tpope/vim-endwise'             " 轻量结尾补全
Plug 'mattn/emmet-vim'               " html/css
" 使用<Tab>键
let g:user_emmet_expandabbr_key = '<Tab>'
" 按文件加载
let g:user_emmet_install_global = 0
autocmd FileType xml,html,javascriptreact,typescriptreact,css,sass,less EmmetInstall

Plug 'tpope/vim-scriptease' " 调试VimScript

if has('nvim')
    finish
endif

Plug 'sheerun/vim-polyglot'          " 语言包
let g:polyglot_disabled = ['sensible']
Plug 'godlygeek/tabular' " Markdown
Plug 'preservim/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
