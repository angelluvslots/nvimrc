return {
  'catppuccin/nvim',
  name = 'catppuccin',
  lazy = false,
  priority = 1000,
  config = function()
    ---[[
    local flavor = 'mocha'

    require('catppuccin').setup {
      flavor = flavor,
      transparent_background = true,
    }

    vim.cmd.colorscheme 'catppuccin'

    local colors = require('catppuccin.palettes').get_palette(flavor)
    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = colors.surface2, bold = true })
    vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = colors.pink })
    vim.api.nvim_set_hl(0, 'LineNr', { fg = colors.pink })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = colors.surface2 })
    --]]
  end,
}
