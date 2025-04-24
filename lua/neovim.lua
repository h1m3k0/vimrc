-- 始终显示状态栏(set laststatus=2) 且占满
vim.opt.laststatus = 3
-- <C-Insert>复制 
vim.keymap.set('v', '<C-Insert>', '"+y', { noremap = true })
-- <S-Insert>粘贴
vim.keymap.set({'i','c'}, '<S-Insert>', '<C-R>+', { noremap = true })
-- 重绘
vim.opt.lazyredraw = false

vim.keymap.set('n', '<F1>', function()
  vim.diagnostic.jump({count = 1, _highest = true})
end)
vim.keymap.set('n', '<S-F1>', function()
  vim.diagnostic.jump({count = -1, _highest = true})
end)
