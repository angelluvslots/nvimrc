return {
  'neovim/nvim-lspconfig',
  cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'mason-org/mason.nvim' },
    { 'mason-org/mason-lspconfig.nvim' },
  },
  config = function()
    local lsp_defaults = require('lspconfig').util.default_config

    -- Add cmp_nvim_lsp capabilities settings to lspconfig
    -- This should be executed before you configure any language server
    lsp_defaults.capabilities = vim.tbl_deep_extend(
      'force',
      lsp_defaults.capabilities,
      require('cmp_nvim_lsp').default_capabilities()
    )

    -- LspAttach is where you enable features that only work
    -- if there is a language server active in the file
    vim.api.nvim_create_autocmd('LspAttach', {
      desc = 'LSP actions',
      callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        vim.keymap.set(
          'n',
          'gD',
          '<cmd>lua vim.lsp.buf.declaration()<cr>',
          opts
        )
        vim.keymap.set(
          'n',
          'gi',
          '<cmd>lua vim.lsp.buf.implementation()<cr>',
          opts
        )
        vim.keymap.set(
          'n',
          'go',
          '<cmd>lua vim.lsp.buf.type_definition()<cr>',
          opts
        )
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
        vim.keymap.set(
          'n',
          'gs',
          '<cmd>lua vim.lsp.buf.signature_help()<cr>',
          opts
        )
        vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set(
          { 'n', 'x' },
          '<F3>',
          '<cmd>lua vim.lsp.buf.format({async = true})<cr>',
          opts
        )
        vim.keymap.set(
          'n',
          '<F4>',
          '<cmd>lua vim.lsp.buf.code_action()<cr>',
          opts
        )
      end,
    })

    local lspconfig = require 'lspconfig'

    local border = {
      { '╭', 'FloatBorder' },
      { '─', 'FloatBorder' },
      { '╮', 'FloatBorder' },
      { '│', 'FloatBorder' },
      { '╯', 'FloatBorder' },
      { '─', 'FloatBorder' },
      { '╰', 'FloatBorder' },
      { '│', 'FloatBorder' },
    }

    lspconfig.gleam.setup {}

    -- LSP settings (for overriding per client)
    local handlers = {
      ['textDocument/hover'] = vim.lsp.with(
        vim.lsp.handlers.hover,
        { border = border }
      ),
      ['textDocument/signatureHelp'] = vim.lsp.with(
        vim.lsp.handlers.signature_help,
        { border = border }
      ),
    }

    local configs = {
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' },
            },
            workspace = {
              checkThirdParty = false,
              telemetry = { enable = false },
              library = {
                vim.env.VIMRUNTIME,
                '${3rd}/love2d/library',
              },
            },
          },
        },
        handlers = handlers,
      },
    }

    require('mason-lspconfig').setup {
      ensure_installed = {
        'lua_ls',
        'rust_analyzer',
        -- 'clangd',
      },
      handlers = {
        -- this first function is the "default handler"
        -- it applies to every language server without a "custom handler"
        function(server_name)
          lspconfig[server_name].setup(configs[server_name] or {
            handlers = handlers,
          })
        end,
      },
    }
  end,
}
