zx = require('zx')
vim.cmd('source ~/.config/nvim/lua/core/options.vim')
vim.g.plug_url_format='https://ghproxy.com/https://github.com/%s'
require('core.plugins')
