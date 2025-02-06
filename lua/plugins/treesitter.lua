---@type LazySpec
return {
  {
    'nvim-treesitter/nvim-treesitter',
    -- 需要安装c语言环境
    build = ':TSUpdate',
    event = 'VeryLazy',
    opts = {
      ensure_installed = { 'vim', 'regex', 'lua', 'bash', 'markdown', 'markdown_inline', },
      auto_install = true,
      -- 高亮
      highlight = {
        enable = true,
        disable = function(_, buf)  -- 高亮100KB以内的文件
            local max_filesize = 100 * 1024
            local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,
        additional_vim_regex_highlighting = false,
      },
      -- 范围选取
      incremental_selection = {
        enable =  true,
        keymaps = {
          init_selection    = '<C-S>',
          node_incremental  = '<C-S>',
          node_decremental  = '<C-S-S>',
        },
      },
      -- 文本对象
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
            ['as'] = { query = '@local.scope', query_group = 'locals' },
            ['is'] = { query = '@local.scope', query_group = 'locals' },
            ['aa'] = '@parameter.outer',
            ['ia'] = '@parameter.inner',
          },
          selection_modes = {
            ['@function.outer'] = 'V', -- linewise
            ['@class.outer']    = 'V',
          },
          include_surrounding_whitespace = true,
        },
      },
    },
    config = function(_, opts)
      require'nvim-treesitter.configs'.setup(opts)
      -- 使用git下载
      require'nvim-treesitter.install'.prefer_git = true
      -- 将git地址从https改为ssh (非官方 不稳定) 下载失败尝试关闭VPN
      for _, setting in pairs(require'nvim-treesitter.parsers'.list) do
        setting.install_info.url = vim.fn.substitute(setting.install_info.url, 'https://github.com/', 'git@github.com:', 'g')
      end
    end,
  },
  {
    -- 文本对象
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    event = 'VeryLazy',
  },
  {
    -- 将当前函数显示为窗口顶部的浮动窗口
    'nvim-treesitter/nvim-treesitter-context',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    event = 'VeryLazy',
  },
  {
    -- 自动Tag
    'windwp/nvim-ts-autotag',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    event = 'VeryLazy',
    config = true,
  },
}
