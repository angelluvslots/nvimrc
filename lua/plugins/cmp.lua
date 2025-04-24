return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  config = function()
    local cmp = require 'cmp'

    cmp.setup {
      sources = {
        { name = 'nvim_lsp' },
      },
      mapping = cmp.mapping.preset.insert {
        ['<Tab>'] = cmp.mapping.confirm { select = true },
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-p>'] = cmp.mapping.select_prev_item { behavior = 'select' },
        ['<C-n>'] = cmp.mapping.select_next_item { behavior = 'select' },
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      snippet = {
        expand = function(args)
          vim.snippet.expand(args.body)
        end,
      },
    }
  end,
}
