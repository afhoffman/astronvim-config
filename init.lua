--              AstroNvim Configuration Table
-- All configuration changes should go inside of the table below

-- You can think of a Lua "table" as a dictionary like data structure the
-- normal format is "key = value". These also handle array like data structures
-- where a value with no key simply has an implicit numeric key
local config = {
  -- Configure AstroNvim updates
  updater = {
    channel = "stable", -- branch name (NIGHTLY ONLY)
  },
  -- Set colorscheme to use
  colorscheme = "sonokai",
  -- Override highlight groups in any theme
  highlights = {
    -- duskfox = { -- a table of overrides/changes to the default
    --   Normal = { bg = "#000000" },
    -- },
    default_theme = function(highlights) -- or a function that returns a new table of colors to set
      local C = require "default_theme.colors"

      highlights.Normal = { fg = C.fg, bg = C.bg }
      return highlights
    end,
  },
  -- set vim options here (vim.<first_key>.<second_key> =  value)
  options = {
    opt = {
      relativenumber = true, -- sets vim.opt.relativenumber
    },
    g = {
      mapleader = " ", -- sets vim.g.mapleader
      sonokai_style = "shusia",
    },
  },
  -- If you need more control, you can use the function()...end notation
  -- options = function(local_vim)
  --   local_vim.opt.relativenumber = true
  --   local_vim.g.mapleader = " "
  --   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
  --   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
  --
  --   return local_vim
  -- end,

  -- Set dashboard header
  header = {
    " █████  ███████ ████████ ██████   ██████",
    "██   ██ ██         ██    ██   ██ ██    ██",
    "███████ ███████    ██    ██████  ██    ██",
    "██   ██      ██    ██    ██   ██ ██    ██",
    "██   ██ ███████    ██    ██   ██  ██████",
    " ",
    "    ███    ██ ██    ██ ██ ███    ███",
    "    ████   ██ ██    ██ ██ ████  ████",
    "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
    "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
    "    ██   ████   ████   ██ ██      ██",
  },
  -- Default theme configuration
  default_theme = {
    -- set the highlight style for diagnostic messages
    diagnostics_style = { italic = true },
    -- Modify the color palette for the default theme
    colors = {
      fg = "#abb2bf",
      bg = "#1e222a",
    },
    -- enable or disable highlighting for extra plugins
    plugins = {
      aerial = true,
      beacon = false,
      bufferline = true,
      dashboard = true,
      highlighturl = true,
      hop = false,
      indent_blankline = true,
      lightspeed = false,
      ["neo-tree"] = true,
      notify = true,
      ["nvim-tree"] = false,
      ["nvim-web-devicons"] = true,
      rainbow = true,
      symbols_outline = false,
      telescope = true,
      vimwiki = false,
      ["which-key"] = true,
    },
  },
  -- Diagnostics configuration (for vim.diagnostics.config({...}))
  diagnostics = {
    virtual_text = true,
    underline = true,
  },
  -- Extend LSP configuration
  lsp = {
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
    -- easily add or disable built in mappings added during LSP attaching
    mappings = {
      n = {
        -- ["<leader>lf"] = false -- disable formatting keymap
      },
    },
    -- add to the global LSP on_attach function
    -- on_attach = function(client, bufnr)
    -- end,

    -- override the mason server-registration function
    -- server_registration = function(server, opts)
    --   require("lspconfig")[server].setup(opts)
    -- end,

    -- Add overrides for LSP server settings, the keys are the name of the server
    ["server-settings"] = {
      -- example for addings schemas to yamlls
      -- yamlls = { -- override table for require("lspconfig").yamlls.setup({...})
      --   settings = {
      --     yaml = {
      --       schemas = {
      --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
      --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
      --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
      --       },
      --     },
      --   },
      -- },
      -- Example disabling formatting for a specific language server
      -- gopls = { -- override table for require("lspconfig").gopls.setup({...})
      --   on_attach = function(client, bufnr)
      --     client.resolved_capabilities.document_formatting = false
      --   end
      -- }
    },
  },
  -- Mapping data with "desc" stored directly by vim.keymap.set().
  --
  -- Please use this mappings table to set keyboard mapping since this is the
  -- lower level configuration and more robust one. (which-key will
  -- automatically pick-up stored data by this setting.)
  mappings = {
    -- first key is the mode
    n = {
      -- second key is the lefthand side of the map
      -- mappings seen under group name "Buffer"
      ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
      ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
      ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
      ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
      ["<leader>bh"] = { "<cmd>HopWord<cr>", desc = "Hop to word" },
      -- quick save
      -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
      --
      -- Extract block doesn't need visual mode
      ["<leader>rbb"] = {
        "<Cmd>lua require('refactoring').refactor('Extract Block')<CR>",
        noremap = true,
        silent = true,
        expr = false,
        desc = "Extract Block",
      },
      ["<leader>rbf"] = {
        "<Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>",
        noremap = true,
        silent = true,
        expr = false,
        desc = "Extract Block To File",
      },
      -- Inline variable can also pick up the identifier currently under the cursor without visual mode
      --
      ["<leader>ri"] = {
        "<Cmd>lua require('refactoring').refactor('Inline Variable')<CR>",
        noremap = true,
        silent = true,
        expr = false,
        desc = "Inline Variable",
      },
    },
    v = {
      -- Remaps for the refactoring operations currently offered by the plugin
      ["<leader>re"] = {
        "<Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>",
        noremap = true,
        silent = true,
        expr = false,
        desc = "Extract Function",
      },
      ["<leader>rf"] = {
        "<Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>",
        noremap = true,
        silent = true,
        expr = false,
        desc = "Extract Function To File",
      },
      ["<leader>rv"] = {
        "<Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>",
        noremap = true,
        silent = true,
        expr = false,
        desc = "Extract Variable",
      },
      ["<leader>ri"] = {
        "<Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>",
        noremap = true,
        silent = true,
        expr = false,
        desc = "Inline Variable",
      },
    },
    t = {
      -- setting a mapping to false will disable it
      -- ["<esc>"] = false,
    },
  },
  -- Configure plugins
  plugins = {
    {
      "sainnhe/sonokai",
    },
    {
      "ThePrimeagen/refactoring.nvim",
      requires = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-treesitter/nvim-treesitter" },
      },
    },
    -- You can disable default plugins as follows:
    -- ["goolord/alpha-nvim"] = { disable = true },

    -- You can also add new plugins here as well:
    -- Add plugins, the packer syntax without the "use"
    -- { "andweeb/presence.nvim" },
    -- {
    --   "ray-x/lsp_signature.nvim",
    --   event = "BufRead",
    --   config = function()
    --     require("lsp_signature").setup()
    --   end,
    -- },
    {
      "phaazon/hop.nvim",
      config = function() require("hop").setup() end,
    },
    -- We also support a key value style plugin definition similar to NvChad:
    -- ["ray-x/lsp_signature.nvim"] = {
    --   event = "BufRead",
    --   config = function()
    --     require("lsp_signature").setup()
    --   end,
    -- },
    -- All other entries override the require("<key>").setup({...}) call for default plugins
    ["null-ls"] = function(config) -- overrides `require("null-ls").setup(config)`
      -- config variable is the default configuration table for the setup functino call
      -- local null_ls = require "null-ls"

      -- Check supported formatters and linters
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
      config.sources = {
        -- Set a formatter
        -- null_ls.builtins.formatting.stylua,
        -- null_ls.builtins.formatting.prettier,
      }
      -- set up null-ls's on_attach function
      -- NOTE: You can uncomment this on attach function to enable format on save
      -- config.on_attach = function(client)
      --   if client.resolved_capabilities.document_formatting then
      --     vim.api.nvim_create_autocmd("BufWritePre", {
      --       desc = "Auto format before save",
      --       pattern = "<buffer>",
      --       callback = vim.lsp.buf.formatting_sync,
      --     })
      --   end
      -- end
      return config -- return final config table to use in require("null-ls").setup(config)
    end,
    treesitter = {
      -- overrides `require("treesitter").setup(...)`
      ensure_installed = {
        "c",
        "cpp",
        "dockerfile",
        "go",
        "help",
        "lua",
        "rust",
        "vim",
        "typescript",
        "python",
        "hcl",
      },
    },
    -- use mason-lspconfig to configure LSP installations
    ["mason-lspconfig"] = { -- overrides `require("mason-lspconfig").setup(...)`
      ensure_installed = {
        "ansiblels",
        "tsserver",
        "gopls",
        "taplo",
        "jedi_language_server",
        "pyright",
        "cmake",
        "sumneko_lua",
        "dockerls",
        "rust_analyzer",
        "clangd",
      },
    },
    -- use mason-tool-installer to configure DAP/Formatters/Linter installation
    ["mason-null-ls"] = { -- overrides `require("mason-tool-installer").setup(...)`
      ensure_installed = {
        "stylua",
        "beautysh",
        "black",
        "buf",
        "cmake_format",
        "prettier",
        "yamlfmt",
        "hadolint",
        "gitlint",
        "flake8",
        "clang-format",
      },
    },
    -- packer = { -- overrides `require("packer").setup(...)`
    --   compile_path = vim.fn.stdpath "data" .. "/packer_compiled.lua",
    -- },
  },
  -- LuaSnip Options
  luasnip = {
    -- Add paths for including more VS Code style snippets in luasnip
    vscode_snippet_paths = {},
    -- Extend filetypes
    filetype_extend = {
      javascript = { "javascriptreact" },
    },
  },
  -- CMP Source Priorities
  -- modify here the priorities of default cmp sources
  -- higher value == higher priority
  -- The value can also be set to a boolean for disabling default sources:
  -- false == disabled
  -- true == 1000
  cmp = {
    source_priority = {
      nvim_lsp = 1000,
      luasnip = 750,
      buffer = 500,
      path = 250,
    },
  },
  -- Modify which-key registration (Use this with mappings table in the above.)
  ["which-key"] = {
    -- Add bindings which show up as group name
    register = {
      -- first key is the mode, n == normal mode
      n = {
        -- second key is the prefix, <leader> prefixes
        ["<leader>"] = {
          -- third key is the key to bring up next level and its displayed
          -- group name in which-key top level menu
          ["b"] = { name = "Buffer" },
          ["r"] = { name = "Refactor", b = { name = "Extract block" } },
        },
      },
      v = {
        ["<leader>"] = {
          ["r"] = { name = "Refactor" },
        },
      },
    },
  },
  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Set key binding
    -- Set autocommands
    -- vim.api.nvim_create_augroup("packer_conf", { clear = true })
    -- vim.api.nvim_create_autocmd("BufWritePost", {
    --   desc = "Sync packer after modifying plugins.lua",
    --   group = "packer_conf",
    --   pattern = "plugins.lua",
    --   command = "source <afile> | PackerSync",
    -- })

    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
  end,
}

return config
