" vim-highlightedyank
" 高亮提示正在复制的内容

" vim低版本
if !exists('##TextYankPost')
  nmap y <Plug>(highlightedyank)
  xmap y <Plug>(highlightedyank)
  omap y <Plug>(highlightedyank)
endif
" 显示时间
let g:highlightedyank_highlight_duration = 2000
if has('ide')  
  " 注: ideavim 类型为 string
  let g:highlightedyank_highlight_duration = ''.g:highlightedyank_highlight_duration
endif
