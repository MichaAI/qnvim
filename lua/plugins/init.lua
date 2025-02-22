local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  {
    "https://github.com/oeyoews/catppuccin"
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  'hrsh7th/nvim-cmp',               -- ядро автодополнения
  'hrsh7th/cmp-buffer',             -- дополнение из буфера
  'hrsh7th/cmp-path',               -- пути к файлам
  'hrsh7th/cmp-nvim-lsp',           -- LSP источник
  'saadparwaiz1/cmp_luasnip',       -- сниппеты
  'L3MON4D3/LuaSnip',               -- движок сниппетов
  'rafamadriz/friendly-snippets',   -- готовые сниппеты
  'onsails/lspkind.nvim',           -- иконки
  'neovim/nvim-lspconfig',          -- базовая интеграция LSP
  'williamboman/mason.nvim',        -- менеджер LSP/линтеров
  'williamboman/mason-lspconfig.nvim', -- мост между mason и lspconfig
  'hrsh7th/cmp-nvim-lsp',           -- интеграция с nvim-cmp
  'folke/trouble.nvim',             -- красивый список диагностики
  'ray-x/lsp_signature.nvim',       -- подсказки аргументов функций
  'lewis6991/gitsigns.nvim',
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {}
    end,
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
      },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
  -- For `plugins.lua` users.
    {
        "OXY2DEV/markview.nvim",
        lazy = false
    },
    {
      'Wansmer/langmapper.nvim',
      lazy = false,
      priority = 1, -- High priority is needed if you will use `autoremap()`
      config = function()
        require('langmapper').setup({--[[ your config ]]})
      end,
    }
})

require "plugins.lsp"
require "plugins.theme"
require "plugins.cmp"
require "plugins.git"
