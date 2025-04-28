-- heirline.lua
return {
  {
    "rebelot/heirline.nvim",
    event = "VeryLazy",
    config = function()
      local conditions = require("heirline.conditions")
      local utils = require("heirline.utils")

      -- 定义标签页组件
      local TabPage = {
        provider = function(self)
          return "%" .. self.tabnr .. "T " .. self.tabnr .. " %T"
        end,
        hl = function(self)
          if self.is_active then
            return { fg = "black", bg = "yellow", bold = true }
          else
            return { fg = "gray", bg = "black" }
          end
        end,
      }

      -- 使用 make_tablist 创建标签页列表
      local TabPages = utils.make_tablist(TabPage)

      local BufferBlock = {
        init = function(self)
          self.bufnr = self.bufnr or 0
          self.filename = vim.api.nvim_buf_get_name(self.bufnr)
          self.filename = self.filename == "" and "[No Name]" or vim.fn.fnamemodify(self.filename, ":t")
        end,
        provider = function(self)
          return string.format(" %d:%s ", self.bufnr, self.filename)
        end,
        hl = function(self)
          if self.is_active then
            return { fg = "black", bg = "yellow", bold = true }
          else
            return { fg = "gray", bg = "black" }
          end
        end,
      }

      -- 创建缓冲区列表
      local BufferLine = utils.make_buflist(BufferBlock, { show_modified = true })

      -- 组装完整的 tabline
      local TabLine = {
        TabPages,
        { provider = "%=" }, -- 分隔符，将缓冲区部分推到右侧
        BufferLine,
      }

      require("heirline").setup({
        tabline = TabLine,
      })

      -- 设置快捷键
      -- 跳转到第 n 个标签页
      for i = 1, 9 do
        vim.keymap.set("n", "<leader>" .. i, i .. "gt", { desc = "跳转到第 " .. i .. " 个标签页" })
      end

      -- 跳转到上一个标签页
      vim.keymap.set("n", "<leader>h", "gT", { desc = "上一个标签页" })

      -- 跳转到下一个标签页
      vim.keymap.set("n", "<leader>l", "gt", { desc = "下一个标签页" })

      -- 跳转到第 n 个缓冲区
      for i = 1, 9 do
        vim.keymap.set("n", "<leader>b" .. i, ":buffer " .. i .. "<CR>", { desc = "跳转到第 " .. i .. " 个缓冲区" })
      end

      -- 跳转到上一个缓冲区
      vim.keymap.set("n", "<leader>bh", ":bprevious<CR>", { desc = "上一个缓冲区" })

      -- 跳转到下一个缓冲区
      vim.keymap.set("n", "<leader>bl", ":bnext<CR>", { desc = "下一个缓冲区" })
    end,
  },
}

