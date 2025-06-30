let s:fuzzy = g:fuzzy
if s:fuzzy == 'default'
    if has('win32')
        let s:fuzzy = 'LeaderF'
    elseif (has('python') || has('python2') || has('python3')) && executable('python')
        let s:fuzzy = 'LeaderF'
    elseif v:version < 800
        let s:fuzzy = 'LeaderF'
    else
        let s:fuzzy = 'fzf'
    endif
endif

if s:fuzzy == 'LeaderF'

    Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
    let g:Lf_CommandMap = {
                \     '<C-J>': ['<Down>', '<C-J>'],
                \     '<C-K>': ['<Up>', '<C-K>'],
                \ }
    let g:Lf_RgConfig = [
                \ "--max-columns=300",
                \ "--type-add web:*.{html,css,js}*",
                \ "--glob=!git/*",
                \ "--hidden"
                \ ]
    let g:Lf_ShortcutF = '<Nop>' " vim lazy"
    nnoremap <Leader>f <Esc>:<C-U>Leaderf

    nnoremap <silent> <Leader>ff :<C-U><C-R>=printf('Leaderf file')<CR><CR>
    xnoremap <silent> <Leader>ff :<C-U><C-R>=printf('Leaderf file --input %s', leaderf#Rg#visual())<CR><CR>

    nnoremap <silent> <Leader>fg :<C-U><C-R>=printf('Leaderf rg')<CR><CR>
    xnoremap <silent> <Leader>fg :<C-U><C-R>=printf('Leaderf rg %s', leaderf#Rg#visual())<CR><CR>

endif

if s:fuzzy == 'fzf'

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
    nnoremap <Leader>ff <CMD>Files<CR>

    nnoremap <Leader>fg <CMD>RG<CR>

endif

