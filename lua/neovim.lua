-- 始终显示状态栏(set laststatus=2) 且占满
vim.o.laststatus = 3
-- <C-Insert>复制 
vim.keymap.set('v', '<C-Insert>', '"+y', { noremap = true })
-- <S-Insert>粘贴
vim.keymap.set({'i','c'}, '<S-Insert>', '<C-R>+', { noremap = true })
