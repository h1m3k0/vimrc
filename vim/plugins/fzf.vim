if v:version < 800
    finish
endif

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

let preview_obj = {
            \ 'options': [
            \     '--layout=reverse',
            \     '--info=inline',
            \     '--preview',
            \     (has('win32') ? 'type' : 'cat') . ' {}'
            \   ]
            \ }
" Files 预览
command! -bang -nargs=? -complete=dir Files
            \ call fzf#vim#files(
            \   <q-args>,
            \   preview_obj,
            \   <bang>0)
" GFiles 预览
command! -bang -nargs=? GFiles
            \ call fzf#vim#gitfiles(
            \   <q-args>,
            \   fzf#vim#with_preview(extendnew(preview_obj, <q-args> == '?' ? { 'placeholder': '' } : {})),
            \   <bang>0)
command! -bang -nargs=* GGrep
            \ call fzf#vim#grep2(
            \   'git grep --line-number -- ',
            \   <q-args>,
            \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)
nnoremap <Leader>ff <CMD>Files<CR>
nnoremap <Leader>fF <CMD>GFiles<CR>
nnoremap <Leader>fg <CMD>RG<CR>
nnoremap <Leader>fG <CMD>GGrep<CR>
