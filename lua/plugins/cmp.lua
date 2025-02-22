-- cmp.lua
local cmp = require('cmp')
local luasnip = require('luasnip')
local lspkind = require('lspkind')

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Enter для подтверждения
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },    -- LSP
    { name = 'luasnip' },     -- сниппеты
    { name = 'buffer' },      -- текущий буфер
    { name = 'path' },        -- пути файлов
  }),
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text',
      maxwidth = math.floor(vim.o.columns * 0.5),
      menu = {
        buffer = '[BUF]',
        nvim_lsp = '[LSP]',
        luasnip = '[SNIP]',
        path = '[PATH]',
      }
    })
  },
  experimental = {
    ghost_text = true, -- призрачный текст подсказки
  }
})

local border_opts = {
  border = 'rounded',
  winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
}
cmp.setup({
    window = {
        completion = cmp.config.window.bordered(border_opts),
        max_height = 15, -- максимальная высота
        documentation = { -- окно документации
          max_width = 60,
          max_height = math.floor(vim.o.lines * 0.3),
          border = 'rounded'
        }
    }
})
