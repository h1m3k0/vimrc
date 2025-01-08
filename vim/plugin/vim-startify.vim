" vim-startify
" vim启动页

let g:startify_custom_header = ['']
let g:startify_lists= [
      \ {'type': 'commands' }, 
      \ {'type': 'files',     'header': [' MRU'],            },
      \ {'type': 'sessions',  'header':[]},
      \ {'type': 'bookmarks', 'header': [' Bookmarks']       },
  \ ]
let g:startify_files_number = 9
let g:startify_commands = [
      \ {'n': ['new Typed buffer: 输入文件类型',
      \        'enew | execute "set filetype=".input("filetype=")']},
      \ {'p': ['new Pasted buffer: 粘贴剪切板内容', 
      \        'enew | execute "normal i\<S-Insert>\<Esc>"']},
      \ {'v': ['open Vimrc: '.substitute($MYVIMRC, '\\', '/', 'g'),
      \        'e '.$MYVIMRC]}
  \ ]
