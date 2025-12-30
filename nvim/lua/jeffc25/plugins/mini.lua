-- Collection of various small independent plugins/modules
--  See: https://github.com/echasnovski/mini.nvim

return {
  {
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup({ n_lines = 500 })

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup({
        highlight_duration = 5000,
        mappings = {
          add = 'sa', -- Add surrounding in Normal and Visual modes
          delete = 'sd', -- Delete surrounding
          find = 'sf', -- Find surrounding (to the right)
          find_left = 'sF', -- Find surrounding (to the left)
          highlight = 'sh', -- Highlight surrounding
          replace = 'sr', -- Replace surrounding

          suffix_last = 'l', -- Suffix to search with "prev" method
          suffix_next = 'n', -- Suffix to search with "next" method
        },
      })

      -- local statusline = require('mini.statusline')
      -- -- set use_icons to true if you have a Nerd Font
      -- statusline.setup({ use_icons = vim.g.have_nerd_font })
      --
      -- -- Configure sections in the statusline by overriding default behavior.
      -- -- Ex: set the section for cursor location to LINE:COLUMN
      -- ---@diagnostic disable-next-line: duplicate-set-field
      -- statusline.section_location = function()
      --   return '%2l:%-2v'
      -- end

      require('mini.splitjoin').setup({
        mappings = {
          toggle = '<Leader>fa',
          split = '',
          join = '',
        },
      })
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
