-- ==========================================
-- ⌨️ Atajos de teclado
-- ==========================================
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- 🔎 Telescope (búsqueda)
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts) -- Buscar archivos (tipo Ctrl+P)
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)  -- Buscar texto en proyecto
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)    -- Listar buffers abiertos
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)  -- Buscar ayuda de Neovim

-- 🌲 Neo-tree (árbol de archivos)
map("n", "<leader>fe", "<cmd>Neotree toggle<cr>", opts) -- Abrir/cerrar árbol
map("n", "<leader>fr", "<cmd>Neotree reveal<cr>", opts) -- Revelar archivo actual
map("n", "<C-n>", "<cmd>Neotree toggle<cr>", opts)      -- Ctrl+n (similar VSCode)

-- 🧑‍💻 LSP
map("n", "gd", vim.lsp.buf.definition, opts)         -- Ir a definición
map("n", "gr", vim.lsp.buf.references, opts)         -- Buscar referencias
map("n", "K", vim.lsp.buf.hover, opts)               -- Documentación flotante
map("n", "<leader>rn", vim.lsp.buf.rename, opts)     -- Renombrar símbolo
map("n", "<leader>ca", vim.lsp.buf.code_action, opts)-- Acciones rápidas (ej: importar clase)
map("n", "<leader>e", vim.diagnostic.open_float, opts)-- Ver error actual
map("n", "[d", vim.diagnostic.goto_prev, opts)       -- Error anterior
map("n", "]d", vim.diagnostic.goto_next, opts)       -- Error siguiente

-- 🎨 Formateo
map({ "n", "v" }, "<leader>f", function()
  require("conform").format({ async = false, lsp_fallback = true })
end, opts) -- Formatear código

-- ⚡ Laravel.nvim
map("n", "<leader>la", "<cmd>Laravel artisan<cr>", opts) -- Ejecutar Artisan
map("n", "<leader>lr", "<cmd>Laravel routes<cr>", opts)  -- Listar rutas
