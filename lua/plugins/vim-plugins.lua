---@type LazySpec
return {
    {
        'preservim/nerdtree',
        lazy = false,
        priority = 1,
        dependencies = {
            {
                'Xuyuanp/nerdtree-git-plugin',
                lazy = false,
                priority = 2,
            },
            {
                'ryanoasis/vim-devicons',
                lazy = false,
                priority = 3,
            },
        },
        init = function()
            vim.cmd [[
            " 切换目录时自动切换vim根目录
            let g:NERDTreeChDirMode = 2
            " 取消CD
            let g:NERDTreeMapCWD = '<Nop>'
            nnoremap <Leader>e <Esc>:<C-U>NERDTree
            nnoremap <silent> <Leader>ef <Esc>:<C-U>NERDTreeFind<CR>
            nnoremap <silent> <Leader>eF <Esc>:<C-U>NERDTreeFind<CR>:NERDTreeVCS<CR>
            nnoremap <silent> <Leader>ee <Esc>:<C-U>NERDTreeMirror<CR>:NERDTreeFocus<CR>
            nnoremap <silent> <Leader>et <Esc>:<C-U>NERDTreeMirror<CR>:NERDTreeToggle<CR>
            nnoremap <silent> <Leader>ev <Esc>:<C-U>NERDTree <C-R>=g:vimdir<CR><CR>
            nnoremap <silent> <Leader>eh <Esc>:<C-U>NERDTree $HOME<CR>
            nnoremap <silent> <Leader>ep <Esc>:<C-U>NERDTree <C-R>=g:vimdir<CR>/plugged<CR>
            ]]
        end
    },
    {
        'easymotion/vim-easymotion',
        dependencies = 'ZSaberLv0/vim-easymotion-chs',
        init = function()
            vim.cmd [[
            " 智能大小写
            let g:EasyMotion_smartcase = 1
            " 禁用默认映射
            let g:EasyMotion_do_mapping = 0
            map  <Leader><Leader>f  <Plug>(easymotion-bd-f)
            map  <Leader><Leader>F  <Plug>(easymotion-bd-f)
            map  <Leader><Leader>t  <Plug>(easymotion-bd-t)
            map  <Leader><Leader>T  <Plug>(easymotion-bd-t)
            ]]
        end,
    },
    { 'tpope/vim-surround',         dependencies = 'tpope/vim-repeat' },
    {
        'vim-scripts/ReplaceWithRegister',
        init = function()
            vim.keymap.del('n', 'gri')
            vim.keymap.del({ 'n', 'x' }, 'gra')
            vim.keymap.del('n', 'grn')
        end
    },
    'tommcdo/vim-exchange',
    { 'kana/vim-textobj-entire',    dependencies = 'kana/vim-textobj-user' },
    { 'vim-scripts/argtextobj.vim', dependencies = 'kana/vim-textobj-user' },
    {
        'machakann/vim-highlightedyank',
        init = function()
            vim.cmd [[
            let g:highlightedyank_highlight_duration = 2000
            ]]
        end,
    },
    { 'michaeljsmith/vim-indent-object', dependencies = 'kana/vim-textobj-user' },
    {
        'junegunn/vim-easy-align',
        init = function()
            vim.cmd [[
            nmap  ga  <Plug>(EasyAlign)
            xmap  ga  <Plug>(EasyAlign)
            ]]
        end,
    },
    'tpope/vim-fugitive',
    'tommcdo/vim-exchange',
    'yianwillis/vimcdoc',
    {
        'mattn/emmet-vim',
        submodules = false, -- 禁用子模块(可能导致Lazy安装失败)
    },
    {
        'kana/vim-arpeggio',
        config = function()
            vim.cmd [[
            Arpeggio inoremap jk <Esc>
            Arpeggio nnoremap io  :
            ]]
        end
    },
    {
        'skywind3000/asyncrun.vim',
        init = function()
            vim.cmd [[
            if has('win32')
                " windows系统使用GBK
                let g:asyncrun_encs = 'gbk'
                endif
                " 自动打开copen
                let g:asyncrun_open = 6
                ]]
            end
        },
        { 'skywind3000/asynctasks.vim',      dependencies = 'skywind3000/asyncrun.vim' },
        {
            'haya14busa/vim-asterisk',
            init = function()
                vim.cmd [[
                let g:asterisk#keeppos = 1 " 保持光标位置
                map *  <Plug>(asterisk-z*)
                map #  <Plug>(asterisk-z#)
                map g* <Plug>(asterisk-gz*)
                map g# <Plug>(asterisk-gz#)
                ]]
            end
        },
        {
            'mg979/vim-visual-multi',
            init = function()
                vim.g.VM_maps = {
                    --  增强VM的撤销(原生undo会有问题)
                    ['Undo'] = 'u',
                    --  增强VM的撤销(原生redo会有问题)
                    ['Redo'] = '<C-r>',
                    --  单词
                    ['Find Under'] = '<A-n>',
                    --  字符
                    ['Add Cursor Down'] = '<A-Down>',
                    --  字符
                    ['Add Cursor Up'] = '<A-Up>',
                    --  字符
                    ['Mouse Cursor'] = '<A-LeftMouse>',
                    --  单词
                    ['Mouse Word'] = '<A-RightMouse>',
                    ['Switch Mode'] = '<Tab>',
                }
            end,
        },
        {
            'simeji/winresizer',
            init = function()
                vim.cmd [[
                let g:winresizer_enable = 1
                let g:winresizer_start_key = '<Leader>we'
                let g:winresizer_gui_enable = 1
                let g:winresizer_gui_start_key = '<Leader>wa'
                let g:winresizer_vert_resize = 1
                let g:winresizer_horiz_resize = 1
                ]]
            end
        },
        {
            'triglav/vim-visual-increment',
            init = function()
                vim.cmd [[
                vnoremap <Leader><C-A> <Plug>VisualIncrement
                vnoremap <Leader><C-X> <Plug>VisualDecrement
                ]]
            end
        },
        { 'preservim/vim-markdown', dependencies = 'godlygeek/tabular', },
    }
