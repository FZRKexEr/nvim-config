

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = '|',
    section_separators = '', 
    disabled_filetypes = {'', 'vim-plug'},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { {'mode', separator = {left = '', right = ''},} },
    lualine_b = {
      { 'filename',  separator = { right = '' } },
      {
        'diagnostics',
        sources = { 'ale' },
        sections = { 'error', 'warn', 'info' },
        symbols = { error = ' ', warn = ' ', info = ' ' },
        colored = true,          
        update_in_insert = false, 
        always_visible = false,   
        separator = { right = '' }
      },
    },
    lualine_c = {'branch',},
    lualine_x = {},
    lualine_y = { {'filetype' , separator = { left = '' }, } },
    lualine_z = { {'progress', separator = { left = '', right = '' }, } },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
