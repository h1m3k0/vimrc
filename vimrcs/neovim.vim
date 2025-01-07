" neovim的配置

" 允许cmd的<S-Insert>
cnoremap <S-Insert> <C-R>+
" 加载neovid的配置
if exists('g:neovide')
  source <sfile>:h/neovide.vim
endif
