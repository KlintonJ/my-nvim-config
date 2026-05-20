-- ~/.config/nvim/lua/plugins/lsp.lua

local servers = {
  "zls",
  "lua_ls",
  "basedpyright",
  "clangd",
}

local function get_lsp_capabilities()
  local caps = vim.lsp.protocol.make_client_capabilities()

  local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
  if ok then
    caps = cmp_lsp.default_capabilities(caps)
  end

  return caps
end

local function root_from_markers(markers, opts)
  opts = opts or {}

  return function(bufnr, on_dir)
    local root = vim.fs.root(bufnr, markers)

    if not root then
      local name = vim.api.nvim_buf_get_name(bufnr)

      if name ~= "" then
        root = vim.fs.dirname(name)
      else
        root = (vim.uv or vim.loop).cwd()
      end
    end

    if opts.avoid_home then
      local home = (vim.uv or vim.loop).os_homedir()

      if root == home then
        local name = vim.api.nvim_buf_get_name(bufnr)

        if name ~= "" then
          root = vim.fs.dirname(name)
        end
      end
    end

    on_dir(root)
  end
end

return {
  {
    "mason-org/mason.nvim",
    lazy = false,
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    lazy = false,
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
    },
    opts = {
      ensure_installed = servers,
      -- Leave automatic_enable at its default: true.
      -- The important part is that we register vim.lsp.config(...)
      -- before calling mason-lspconfig.setup(opts) below.
    },
    config = function(_, opts)
      local caps = get_lsp_capabilities()

      -----------------------------------------------------------------------
      -- Global LspAttach keymaps
      -----------------------------------------------------------------------
      local group = vim.api.nvim_create_augroup("MyLspKeymaps", { clear = true })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = group,
        callback = function(e)
          local key_opts = {
            buffer = e.buf,
            silent = true,
            noremap = true,
          }

          vim.keymap.set("n", "gd", vim.lsp.buf.definition, key_opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, key_opts)
          vim.keymap.set("n", "<leader>diag", vim.diagnostic.open_float, key_opts)
          vim.keymap.set("n", "<leader>actions", vim.lsp.buf.code_action, key_opts)
          vim.keymap.set("n", "<leader>refs", vim.lsp.buf.references, key_opts)
          vim.keymap.set("n", "<leader>rename", vim.lsp.buf.rename, key_opts)
        end,
      })

      -----------------------------------------------------------------------
      -- Diagnostics UI
      -----------------------------------------------------------------------
      vim.diagnostic.config({
        virtual_text = true,
        update_in_insert = true,
        float = {
          focusable = false,
          style = "minimal",
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      })

      -----------------------------------------------------------------------
      -- Server configs
      -----------------------------------------------------------------------

      vim.lsp.config("lua_ls", {
        capabilities = caps,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })

      vim.lsp.config("clangd", {
        capabilities = caps,
        root_dir = root_from_markers({
          ".git",
          "compile_commands.json",
          "compile_flags.txt",
          "CMakeLists.txt",
          "Makefile",
          "meson.build",
          "build.ninja",
        }),
      })

      vim.lsp.config("zls", {
        capabilities = caps,
      })

      vim.lsp.config("basedpyright", {
        capabilities = caps,
        settings = {
          basedpyright = {
            analysis = {
              diagnosticMode = "openFilesOnly",
              inlayHints = {
                callArgumentNames = true,
              },
              fileEnumerationTimeout = 30,
            },
          },
        },
        root_dir = root_from_markers({
          "pyrightconfig.json",
          "pyproject.toml",
          "setup.py",
          "setup.cfg",
          "requirements.txt",
          ".git",
        }, {
          avoid_home = true,
        }),
      })

      -----------------------------------------------------------------------
      -- Must happen AFTER vim.lsp.config(...) above.
      -- This is what installs + auto-enables Mason-managed servers.
      -----------------------------------------------------------------------
      require("mason-lspconfig").setup(opts)
    end,
  },
}
