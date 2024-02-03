local utils = require "astronvim.utils"
return {
  {
    "williamboman/mason.nvim",
    optional = true,
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then vim.list_extend(opts.ensure_installed, { "codelldb" }) end
    end,
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^4", -- Recommended
    ft = { "rust" },
    opts = {
      inlay_hints = {
        highlight = "NonText",
      },
      tools = {
        hover_actions = {
          auto_focus = true,
        },
      },
      server = {
        on_attach = function(_, bufnr)
          -- register which-key mappings
          local wk = require "which-key"
          wk.register({
            ["<leader>la"] = { function() vim.cmd.RustLsp "codeAction" end, "Code Action" },
            ["<leader>lr"] = { function() vim.cmd.RustLsp "runnables" end, "Runnables" },
            ["<leader>lh"] = { function() vim.cmd.RustLsp { "hover", "actions" } end, "Hover Actions" },
            ["<leader>lc"] = { function() vim.cmd.RustLsp "openCargo" end, "Open Cargo.toml" },
            ["<leader>dr"] = { function() vim.cmd.RustLsp "debuggables" end, "Rust debuggables" },
          }, { mode = "n", buffer = bufnr })
        end,
        settings = {
          -- rust-analyzer language server configuration
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
              loadOutDirsFromCheck = true,
              runBuildScripts = true,
            },
            -- Add clippy lints for Rust.
            checkOnSave = {
              allFeatures = true,
              command = "clippy",
              extraArgs = { "--no-deps" },
            },
            procMacro = {
              enable = true,
              ignored = {
                ["async-trait"] = { "async_trait" },
                ["napi-derive"] = { "napi" },
                ["async-recursion"] = { "async_recursion" },
              },
            },
          },
        },
      },
    },
    config = function(_, opts) vim.g.rustaceanvim = vim.tbl_deep_extend("force", {}, opts or {}) end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "rust")
      end
    end,
  },
  -- {
  --   "simrat39/rust-tools.nvim",
  --   ft = { "rust" },
  --   init = function() astronvim.lsp.skip_setup = utils.list_insert_unique(astronvim.lsp.skip_setup, "rust_analyzer") end,
  --   opts = function()
  --     local adapter
  --     local success, package = pcall(function() return require("mason-registry").get_package "codelldb" end)
  --     if success then
  --       local package_path = package:get_install_path()
  --       local codelldb_path = package_path .. "/codelldb"
  --       local liblldb_path = package_path .. "/extension/lldb/lib/liblldb"
  --       local this_os = vim.loop.os_uname().sysname
  --
  --       -- The path in windows is different
  --       if this_os:find "Windows" then
  --         codelldb_path = package_path .. "\\extension\\adapter\\codelldb.exe"
  --         liblldb_path = package_path .. "\\extension\\lldb\\bin\\liblldb.dll"
  --       else
  --         -- The liblldb extension is .so for linux and .dylib for macOS
  --         liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
  --       end
  --       adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path)
  --     else
  --       adapter = require("rust-tools.dap").get_codelldb_adapter()
  --     end
  --
  --     return { server = require("astronvim.utils.lsp").config "rust_analyzer", dap = { adapter = adapter } }
  --   end,
  --   dependencies = {
  --     {
  --       "jay-babu/mason-nvim-dap.nvim",
  --       opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "codelldb") end,
  --     },
  --   },
  -- },
  {
    "Saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    init = function()
      vim.api.nvim_create_autocmd("BufRead", {
        group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
        pattern = "Cargo.toml",
        callback = function()
          require("cmp").setup.buffer { sources = { { name = "crates" } } }
          require "crates"
        end,
      })
    end,
    opts = {
      null_ls = {
        enabled = true,
        name = "crates.nvim",
      },
    },
  },
}
