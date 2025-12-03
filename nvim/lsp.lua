-- ==========================================
-- ⚡ LSP y Autocompletado para Laravel/PHP
-- ==========================================

-- Plugins de UI / UX
require("lualine").setup({})
require("gitsigns").setup({})
require("which-key").setup({})
require("telescope").setup({})
require("nvim-treesitter.configs").setup({
  ensure_installed = { "lua", "php", "javascript", "typescript", "html", "css", "json", "bash", "dockerfile", "yaml" },
  highlight = { enable = true },
})

-- ================================
-- 🧩 Configuración base de LSP
-- ================================
local lspconfig = require("lspconfig")
local cmp = require("cmp")
local lspkind = require("lspkind")
local cmp_lsp = require("cmp_nvim_lsp")

-- Habilita capacidades de autocompletado
local capabilities = cmp_lsp.default_capabilities()

-- Mason: gestor de servidores LSP y formatters
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "intelephense", "tailwindcss", "tsserver", "eslint", "emmet_ls",
    "bashls", "jsonls", "yamlls", "dockerls",
  }
})

-- ================================
-- 🔮 Configuración de Autocompletado
-- ================================
require("luasnip.loaders.from_vscode").lazy_load()
cmp.setup({
  snippet = { expand = function(args) require("luasnip").lsp_expand(args.body) end },
  mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
  }),
  sources = {
    { name = "nvim_lsp" }, { name = "buffer" }, { name = "path" }, { name = "luasnip" },
  },
  formatting = { format = lspkind.cmp_format({ maxwidth = 50, ellipsis_char = "…" }) },
})

-- ================================
-- 🐘 PHP (Intelephense con licencia Pro)
-- ================================
lspconfig.intelephense.setup({
  capabilities = capabilities,
  settings = {
    intelephense = {
      environment = {
        phpVersion = "8.3", -- versión PHP de tu proyecto
      },
      files = {
        maxSize = 5000000, -- máximo tamaño de archivos indexados
      },
      format = { enable = false }, -- usamos Conform.nvim para formatear
      licenceKey = vim.fn.getenv("INTELEPHENSE_LICENSE"), -- 🔑 clave Pro desde variable de entorno
    },
  },
})

-- ================================
-- 🎨 Tailwind (soporta Blade también)
-- ================================
lspconfig.tailwindcss.setup({
  capabilities = capabilities,
  filetypes = { "html", "css", "blade", "php", "javascript", "typescript", "react", "typescriptreact", "javascriptreact" },
  init_options = { userLanguages = { blade = "html" } },
})

-- ================================
-- ⚡ Emmet (HTML / Blade)
-- ================================
lspconfig.emmet_ls.setup({
  capabilities = capabilities,
  filetypes = { "html", "css", "blade", "javascriptreact", "typescriptreact" },
})

-- ================================
-- 📜 TypeScript / JavaScript
-- ================================
lspconfig.tsserver.setup({ capabilities = capabilities })
lspconfig.eslint.setup({ capabilities = capabilities })

-- ================================
-- 🛠️ Otros útiles
-- ================================
lspconfig.bashls.setup({ capabilities = capabilities })
lspconfig.jsonls.setup({ capabilities = capabilities })
lspconfig.yamlls.setup({ capabilities = capabilities })
lspconfig.dockerls.setup({ capabilities = capabilities })
