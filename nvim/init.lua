-- ==========================================
-- 🚀 Configuración base de Neovim para Laravel
-- ==========================================

-- Definir tecla <leader> (prefijo de atajos personalizados)
-- Aquí usamos la barra espaciadora como <leader>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Opciones básicas de edición
vim.opt.number = true              -- Mostrar número de línea
vim.opt.relativenumber = true      -- Líneas relativas (útil para moverse con jk)
vim.opt.ignorecase = true          -- Búsqueda insensible a mayúsculas
vim.opt.smartcase = true           -- Pero sensible si usas mayúsculas
vim.opt.termguicolors = true       -- Colores 24-bit
vim.opt.updatetime = 300           -- Update rápido para LSP/diagnósticos
vim.opt.signcolumn = "yes"         -- Columna de signos (diagnósticos, git)
vim.opt.expandtab = true           -- Usar espacios en vez de tabs
vim.opt.shiftwidth = 2             -- Número de espacios por indentación
vim.opt.tabstop = 2                -- Tamaño de tabulador

-- Bootstrap de lazy.nvim (gestor de plugins)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- Cargar configuración modular
require("lazy").setup("plugins", { ui = { border = "rounded" } })
require("keymaps")   -- Atajos
require("lsp")       -- LSP + autocompletado
require("format")    -- Formateo
