-- lua/lsp.lua
local lsp = require('lspconfig')
-- Общие хоткеи и функции
local function common_on_attach(client, bufnr)
  -- Базовые LSP хоткеи
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr, desc = 'Go to definition' })
  vim.keymap.set('n', 'gr', '<cmd>TroubleToggle lsp_references<CR>', { buffer = bufnr, desc = 'References' })
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = bufnr, desc = 'Code actions' })
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr, desc = 'Hover docs' })
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'Go to declaration' })
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = 'Go to implementation' })
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = 'Show references' })

  -- Кастомная диагностика
  vim.api.nvim_create_autocmd('CursorHold', {
    buffer = bufnr,
    callback = function()
      vim.diagnostic.open_float(nil, {
        scope = 'cursor',
        border = 'rounded'
      })
    end
  })
end

-- Специфичные настройки для Lua
lsp.lua_ls.setup({
  on_attach = function(client, bufnr)
    common_on_attach(client, bufnr)
    -- Lua-specific keymaps
    vim.keymap.set('n', '<leader>li', '<cmd>LspInfo<CR>', { buffer = bufnr, desc = 'LSP info' })
  end,
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = {
        globals = { 'vim', 'use' },  -- Игнорировать предупреждения для этих глобалов
        disable = { 'lowercase-global' }  -- Отключить конкретные варнинги
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false  -- Не спрашивать про сторонние плагины
      },
      telemetry = { enable = false },
      completion = {
        callSnippet = 'Replace'  -- Автоподстановка аргументов функций
      }
    }
  }
})

lsp.rust_analyzer.setup({
  on_attach = function(client, bufnr)
    common_on_attach(client, bufnr)
    -- Rust-specific keymaps
    vim.keymap.set('n', '<leader>rr', '<cmd>RustRun<CR>', { buffer = bufnr, desc = 'Run rust code' })
    vim.keymap.set('n', '<leader>rt', '<cmd>RustTest<CR>', { buffer = bufnr, desc = 'Run test' })
  end,
  settings = {
    ['rust-analyzer'] = {
      cargo = {
        allFeatures = true,
        loadOutDirsFromCheck = true
      },
      checkOnSave = {
        command = 'clippy',  -- Включить Clippy при сохранении
        extraArgs = { '--', '-W', 'clippy::pedantic' }
      },
      procMacro = {
        enable = true  -- Поддержка procedural macros
      },
      diagnostics = {
        enable = true,
        experimental = { enable = true }  -- Расширенные диагностики
      },
      lens = {
        enable = true  -- Показывать линзы (реализации, тесты)
      },
      hover = {
        actions = {
          references = { enable = true },  -- Показывать ссылки при ховере
          run = { enable = true }  -- Запуск кода из документации
        }
      }
    }
  }
})

