return {
  'ellisonleao/gruvbox.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    --[[
    require('gruvbox').setup {
      transparent_mode = true,
      contrast = 'soft',
    }
    vim.cmd.colorscheme 'gruvbox'
    --]]
  end,
}
