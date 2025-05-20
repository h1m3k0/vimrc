-- 始终显示状态栏(set laststatus=2) 且占满
vim.opt.laststatus = 3
-- <C-Insert>复制 
vim.keymap.set('v', '<C-Insert>', '"+y', { noremap = true })
-- <S-Insert>粘贴
vim.keymap.set({'i','c'}, '<S-Insert>', '<C-R>+', { noremap = true })
-- 重绘
vim.opt.lazyredraw = false
-- 终端
vim.keymap.set('n', '<Leader>t', '<CMD>botright terminal<CR>', { noremap = true })
-- 终端 打开时 自动切换为startinsert
vim.api.nvim_create_autocmd('TermOpen', {
  pattern = '*', callback = function() vim.cmd.startinsert() end
})
-- 终端 <C-W>时
vim.keymap.set('t', '<C-w>', function()
    -- <C-W>切换窗口
    vim.api.nvim_feedkeys(
        vim.api.nvim_replace_termcodes('<C-\\><C-n><C-w>', true, false, true),
        'n', true
    )
    -- 取消(停留在终端), 自动改为startinsert()
    vim.schedule(function()
        local win_id = vim.api.nvim_get_current_win()
        local buf = vim.api.nvim_win_get_buf(win_id)
        if vim.bo[buf].buftype == 'terminal' then
            vim.api.nvim_win_call(win_id, function()
                vim.cmd.startinsert()
            end)
        end
    end)
end)
-- 终端 切换窗口时 如果终端为normal 切换为startinsert
vim.api.nvim_create_autocmd('WinEnter', {
    pattern = 'term://*',
    callback = function()
        if vim.fn.mode() == 'n' then
            vim.cmd.startinsert()
        end
    end
})


vim.keymap.set('n', '<F1>', function()
  vim.diagnostic.jump({count = 1, _highest = true})
end)
vim.keymap.set('n', '<S-F1>', function()
  vim.diagnostic.jump({count = -1, _highest = true})
end)
