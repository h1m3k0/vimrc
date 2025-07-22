Plug 'editorconfig/editorconfig-vim' " editorconfig

Plug 'tpope/vim-endwise'             " 轻量结尾补全
Plug 'tpope/vim-scriptease' " 调试VimScript

Plug 'sheerun/vim-polyglot', Cond(!has('nvim'))  " 语言包
if !has('nvim')
    let g:polyglot_disabled = ['sensible']
endif
Plug 'mattn/emmet-vim', Cond(!has('nvim'))       " html/css
if !has('nvim')
    " 使用<Tab>键
    let g:user_emmet_expandabbr_key = '<Tab>'
    " 按文件加载
    let g:user_emmet_install_global = 0
    autocmd FileType xml,html,javascriptreact,typescriptreact,css,sass,less EmmetInstall
endif
Plug 'godlygeek/tabular', Cond(!has('nvim')) " Markdown
Plug 'preservim/vim-markdown', Cond(!has('nvim'))
Plug 'iamcco/markdown-preview.nvim', Cond(!has('nvim'), { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug'] } )
