-- 设置 F3 为打开或切换 Neo-tree
vim.keymap.set('n', '<F3>', '<Cmd>Neotree toggle<CR>', { desc = 'Toggle Neo-tree' })

-- 设置 F4 为关闭 Neo-tree
vim.keymap.set('n', '<F4>', '<Cmd>Neotree close<CR>', { desc = 'Close Neo-tree' })

-- 更方便地在窗口之间跳转
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- 调整缩进后自动选中，方便再次操作
vim.keymap.set('v', '<', '<gv', { noremap = true, silent = true })
vim.keymap.set('v', '>', '>gv', { noremap = true, silent = true })

-- 使用 <leader>s 快速保存文件
vim.keymap.set('n', '<leader>s', ':update<CR>', { noremap = true, silent = true })
