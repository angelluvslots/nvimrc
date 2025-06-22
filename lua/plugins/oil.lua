return {
  'stevearc/oil.nvim',
  opts = {},
  dependencies = { { 'echasnovski/mini.icons', opts = {} } },
  lazy = false,
  config = function()
    require('oil').setup {}

    vim.keymap.set('n', '-', '<Cmd>Oil .<CR>')
  end,
}
