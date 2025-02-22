vim.opt.number = true         -- номера строк
vim.opt.relativenumber = true -- относительные номера
vim.opt.cursorline = true     -- подсветка текущей строки
vim.opt.termguicolors = true  -- true-цвета (обязательно для тем)
vim.opt.signcolumn = 'yes'    -- колонка для иконок (линтеры, гиты)
vim.opt.mouse = 'a'           -- мышь во всех режимах
vim.opt.tabstop = 4           -- 1 таб = 4 пробела
vim.opt.shiftwidth = 4        -- автоотступ = 4 пробела
vim.opt.expandtab = true      -- пробелы вместо табов
vim.opt.smartindent = true    -- умные отступы
vim.opt.wrap = false          -- не переносить длинные строки
vim.opt.undofile = true       -- вечная история изменений
vim.opt.ignorecase = true     -- игнорировать регистр
vim.opt.smartcase = true      -- если есть заглавные → case-sensitive
vim.opt.hlsearch = true       -- подсветка результатов
vim.opt.incsearch = true      -- поиск при вводе
vim.api.nvim_set_option("clipboard", "unnamed")


