""""""""""""""""""""""""""""
"""""" 插件加载前的配置(顺序: 0)
""""""""""""""""""""""""""""

" << EasyMotion >>
" 智能大小写
let g:EasyMotion_smartcase = 1
" 禁用默认映射
let g:EasyMotion_do_mapping = 0

" << NERDTree >>
" 切换目录时自动切换vim根目录
let NERDTreeChDirMode = 2

" << multi-cursors >>
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_start_word_key      = '<A-n>'
let g:multi_cursor_select_all_word_key = '<A-C-n>'
let g:multi_cursor_start_key           = 'g<A-n>'
let g:multi_cursor_select_all_key      = 'g<A-C-n>'
let g:multi_cursor_next_key            = '<A-n>'
let g:multi_cursor_prev_key            = '<A-p>'
let g:multi_cursor_skip_key            = '<A-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" << argtextobj >>
" ideavim 泛型
let g:argtextobj_pairs = '(:),{:},<:>'

" << highlightedyank >>
" 显示时间
let g:highlightedyank_highlight_duration = 2000
if has('ide')  " 注: ideavim 类型为 string
    let g:highlightedyank_highlight_duration = ''.g:highlightedyank_highlight_duration
endif

" << quick-scope >>
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

