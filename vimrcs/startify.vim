" startify插件配置
let g:startify_custom_header = ['']
let g:startify_lists = [
      \ { 'type': 'commands', },
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ ]
let g:startify_files_number = 5
let g:startify_commands = [
      \ { 'n': ['new Typed Buffer: 输入文件类型', 'call StartifyNewTypedBuffer()'] },
      \ { 'p': ['new Pasted Buffer: 粘贴剪切板内容', 'call StartifyNewPastedBuffer()'] },
      \ { 'b': ['reload','call StartifyReload()'] },
      \ ]
function! StartifyNewTypedBuffer() 
    enew
    execute 'set filetype='.input('filetype=')
endfunction
function! StartifyNewPastedBuffer()
    enew
    execute "norm i\<s-insert>\<esc>"
endfunction
function! StartifyReload()
    let g:startify_custom_header = ['']
    Startify
endfunction

