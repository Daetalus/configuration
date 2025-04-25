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
-- 切换到上一个 buffer
vim.keymap.set("n", "<leader>h", "<cmd>BufferLineCyclePrev<CR>", { desc = "上一个 Buffer" })

-- 切换到下一个 buffer
vim.keymap.set("n", "<leader>l", "<cmd>BufferLineCycleNext<CR>", { desc = "下一个 Buffer" })

for i = 1, 9 do
  vim.keymap.set("n", "<leader>" .. i, function()
    require("bufferline").go_to_buffer(i, true)
  end, { desc = "跳转到第 " .. i .. " 个 buffer" })
end
