if has('win32') || ((has('python') || has('python3')) && executable('python'))
    Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
    let g:Lf_CommandMap = {
                \     '<C-J>': ['<Down>', '<C-J>'],
                \     '<C-K>': ['<Up>', '<C-K>'],
                \ }
    let g:Lf_ShortcutF = '<Nop>'
    nnoremap <Leader>ff <Esc>:<C-U>Leaderf file<CR>
    nnoremap <Leader>fF <Esc>:<C-U>Leaderf file <C-R>=GetGitRoot('')<CR><CR>
    nnoremap <Leader>fg <Esc>:<C-U>Leaderf rg --max-columns=300 --live<CR>
    nnoremap <Leader>fG <Esc>:<C-U>Leaderf rg --max-columns=300 --live "" <C-R>=GetGitRoot('')<CR><CR>

    function! GetGitRoot(dir)
      let dir = len(a:dir) ? a:dir : substitute(split(expand('%:p:h'), '[/\\]\.git\([/\\]\|$\)')[0], '^fugitive://', '', '')
      let root = systemlist('git -C ' . shellescape(dir) . ' rev-parse --show-toplevel')[0]
      return v:shell_error ? '' : (len(a:dir) ? fnamemodify(a:dir, ':p') : root)
    endfunction

elseif v:version >= 800
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
endif

