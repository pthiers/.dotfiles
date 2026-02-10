-- ==========================================
-- 📦 Plugins instalados con lazy.nvim
-- ==========================================
return {
  -- Dependencias base
  { "nvim-lua/plenary.nvim" },
  { "nvim-tree/nvim-web-devicons" },

  -- 🔎 Telescope → búsqueda de archivos, texto, buffers
  { "nvim-telescope/telescope.nvim", tag = "0.1.8", dependencies = { "nvim-lua/plenary.nvim" } },

  -- 🌲 Neo-tree → Árbol de archivos
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { "<leader>fe", "<cmd>Neotree toggle<cr>", desc = "Abrir/cerrar árbol" },
      { "<leader>fr", "<cmd>Neotree reveal<cr>", desc = "Mostrar archivo actual en árbol" },
      { "<C-n>", "<cmd>Neotree toggle<cr>", desc = "Toggle árbol (Ctrl+n estilo VSCode)" },
    },
    opts = {
      filesystem = {
        filtered_items = {
          hide_dotfiles = false, -- Mostrar archivos ocultos (ej: .env)
          hide_gitignored = true, -- Ocultar los que están en .gitignore
          hide_by_name = { "node_modules", "vendor", ".git", ".DS_Store" },
        },
        follow_current_file = { enabled = true }, -- Seguir archivo actual
        use_libuv_file_watcher = true, -- Auto-refresh rápido
      },
    },
  },

  -- 🌳 Treesitter → resaltado de sintaxis avanzado
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- UI extra
  { "nvim-lualine/lualine.nvim" }, -- Barra de estado
  { "lewis6991/gitsigns.nvim" },   -- Signos de git
  { "folke/which-key.nvim" },      -- Ayuda visual de atajos

  -- ⚡ LSP + Autocompletado
  { "williamboman/mason.nvim" },          -- Gestor de LSP/formatters
  { "williamboman/mason-lspconfig.nvim" },
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/nvim-cmp" },                 -- Autocompletado
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "L3MON4D3/LuaSnip", version = "v2.*" }, -- Snippets
  { "saadparwaiz1/cmp_luasnip" },
  { "rafamadriz/friendly-snippets" },       -- Colección de snippets
  { "onsails/lspkind.nvim" },               -- Iconos en autocompletado

  -- 🎨 Formateo / lint
  { "stevearc/conform.nvim" },
  { "nvimtools/none-ls.nvim" },

  -- 🐘 Laravel helpers
  { "adalessa/laravel.nvim", dependencies = { "nvim-telescope/telescope.nvim" } },
  { "jwalton512/vim-blade" }, -- Sintaxis Blade
  { "mattn/emmet-vim" },      -- Expansión rápida de HTML

  -- 🎨 Colores
  { "folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {} },
}
