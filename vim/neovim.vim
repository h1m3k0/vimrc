" neovim的配置

" <C-Insert>复制 
vnoremap <C-Insert> "+y
" <S-Insert>粘贴
inoremap <S-Insert> <C-R>+
cnoremap <S-Insert> <C-R>+

" 加载neovid的配置
if exists('g:neovide')
  source <sfile>:h/neovide.vim
endif
