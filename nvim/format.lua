-- ==========================================
-- 🎨 Configuración de formateo
-- ==========================================
require("conform").setup({
  -- Formateo automático al guardar
  format_on_save = function(bufnr)
    local ft = vim.bo[bufnr].filetype
    local enable = { php=true, blade=true, javascript=true, typescript=true, json=true, yaml=true, html=true, css=true }
    if enable[ft] then
      return { timeout_ms = 3000, lsp_fallback = true }
    end
  end,
  -- Formateadores por tipo de archivo
  formatters_by_ft = {
    php = { "pint" },              -- Laravel Pint
    blade = { "blade-formatter" }, -- Blade formatter
    javascript = { "prettierd", "prettier" },
    typescript = { "prettierd", "prettier" },
    json = { "prettierd", "prettier" },
    yaml = { "prettierd", "prettier" },
    html = { "prettierd", "prettier" },
    css = { "prettierd", "prettier" },
  },
})

-- none-ls (null-ls) → diagnósticos extra
local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.eslint_d, -- JS/TS lint
    null_ls.builtins.diagnostics.phpstan,  -- PHPStan (si está instalado en el proyecto)
    null_ls.builtins.formatting.blade_formatter, -- Extra para Blade
  },
})
