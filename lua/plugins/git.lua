-- config
require('gitsigns').setup({
  signs = {
    add          = { text = '▎' },
    change       = { text = '▎' },
    delete       = { text = '▎' },
    topdelete    = { text = '契' },
    changedelete = { text = '▎' },
  },
  current_line_blame = true,  -- Показывать автора строки
  current_line_blame_opts = {
    delay = 300,              -- Задержка перед показом (мс)
    virt_text_pos = 'right_align'
  },
  on_attach = function(bufnr)
    vim.keymap.set('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() require('gitsigns').next_hunk() end)
      return '<Ignore>'
    end, { expr = true, buffer = bufnr })

    vim.keymap.set('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() require('gitsigns').prev_hunk() end)
      return '<Ignore>'
    end, { expr = true, buffer = bufnr })
  end
})

