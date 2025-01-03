" vim-highlightedyank


" 显示时间
let g:highlightedyank_highlight_duration = 2000
if has('ide')  
  " 注: ideavim 类型为 string
  let g:highlightedyank_highlight_duration = ''.g:highlightedyank_highlight_duration
endif
