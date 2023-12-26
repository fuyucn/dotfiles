return {
  {
    "williamboman/mason.nvim",
    config = function()
      require('mason').setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls", 'tsserver', "html", "eslint", "tailwindcss", "cssls", "cssmodules_ls", "graphql"
        },
        automatic_installation = true
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    -- event = { "BufReadPre", "BufNewFile" },
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    config = function()
      local lspconfig = require('lspconfig')

      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      local capabilities = cmp_nvim_lsp.default_capabilities()

      lspconfig.lua_ls.setup({
        capabilities = capabilities
        -- settings = {
        --   Lua = {
        --     diagnostics = {
        --       globals = { "vim" }
        --     },
        --     -- hint = { enable = true }
        --   }
        -- },
      })

      lspconfig.tsserver.setup({
        capabilities = capabilities,
        init_options = {
          usePlaceholders = true
        }
      })

      -- lspconfig.eslint.setup({
      --     capabilities = capabilities
      --     --   -- on_attach = function(_, bufnr)
      --     --   --   vim.api.nvim_create_autocmd('BufWritePre', {
      --     --   --     buffer = bufnr,
      --     --   --     command = 'EslintFixAll'
      --     --   --   })
      --     --   -- end
      -- })

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts = {
            buffer = ev.buf
          }
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
          -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
          -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
          -- vim.keymap.set('n', '<space>wl', function()
          --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          -- end, opts)
          vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
          vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format {
              async = true,
              timeout_ms = 2000,
            }
          end, opts)
        end,
      })

      -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      -- vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, {})
    end
  },
  {
    "nvimtools/none-ls.nvim", -- configure formatters & linters
    lazy = true,
    dependencies = { "jay-babu/mason-null-ls.nvim" },
    config = function()
      local mason_null_ls = require("mason-null-ls")

      local null_ls = require("null-ls")

      local null_ls_utils = require("null-ls.utils")

      mason_null_ls.setup({
        ensure_installed = {
          -- "prettier", -- prettier formatter
          "stylua",  -- lua formatter
          "black",   -- python formatter
          "pylint",  -- python linter
          "eslint_d" -- js linter
        }
      })

      -- for conciseness
      local formatting = null_ls.builtins.formatting   -- to setup formatters
      local diagnostics = null_ls.builtins.diagnostics -- to setup linters

      -- to setup format on save
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

      -- configure null_ls
      null_ls.setup({
        -- add package.json as identifier for root (for typescript monorepos)
        root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),
        -- setup formatters & linters
        sources = { --  to disable file types use
          --  "formatting.prettier.with({disabled_filetypes: {}})" (see null-ls docs)
          formatting.prettier.with({
            extra_filetypes = { "svelte" }
          }),                                                                                                -- js/ts formatter
          formatting.stylua,                                                                                 -- lua formatter
          formatting.isort, formatting.black, diagnostics.pylint, diagnostics.eslint_d.with({                -- js/ts linter
          condition = function(utils)
            return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs", '.eslintrc.json', '.eslintrc.*' }) -- only enable if root has .eslintrc.js or .eslintrc.cjs
          end
        })
        },
        -- configure format on save
        on_attach = function(current_client, bufnr)
          if current_client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({
              group = augroup,
              buffer = bufnr
            })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({
                  filter = function(client)
                    --  only use null-ls for formatting instead of lsp server
                    return client.name == "null-ls"
                  end,
                  bufnr = bufnr
                })
              end
            })
          end
        end
      })
    end
  }
}
