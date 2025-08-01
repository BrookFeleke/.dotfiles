return {
  'L3MON4D3/LuaSnip',
  config = function()
    local ls = require 'luasnip' -- Get the luasnip module

    -- Call the setup function with your options
    ls.setup {
      history = true,
      region_check_events = 'InsertEnter',
      delete_check_events = 'TextChanged,InsertLeave',
    }
    require('luasnip.loaders.from_vscode').lazy_load() -- keep this for friendly-snippets
    require('luasnip.loaders.from_lua').load {
      paths = '~/.config/nvim/lua/brook/snippets',
    }
  end,
}
