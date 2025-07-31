Plug 'editorconfig/editorconfig-vim' " editorconfig

Plug 'tpope/vim-endwise'             " 轻量结尾补全
Plug 'tpope/vim-scriptease' " 调试VimScript

if Plug('sheerun/vim-polyglot', !has('nvim'))  " 语言包
    let g:polyglot_disabled = ['sensible']
endif
if Plug('mattn/emmet-vim', !has('nvim'))       " html/css
    " 使用<Tab>键
    let g:user_emmet_expandabbr_key = '<Tab>'
    " 按文件加载
    let g:user_emmet_install_global = 0
    autocmd FileType xml,html,javascriptreact,typescriptreact,css,sass,less EmmetInstall
endif
PlugIf 'godlygeek/tabular', !has('nvim')  " Markdown
PlugIf 'preservim/vim-markdown', !has('nvim')
