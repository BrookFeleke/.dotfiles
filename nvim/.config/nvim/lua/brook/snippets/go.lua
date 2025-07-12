local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s('errf', {
    t { 'if err != nil {', '\tfmt.Printf("' },
    i(1, 'something went wrong: %v'),
    t '", err)',
    t { '', '}' },
  }),
  s('errl', {
    t { 'if err != nil {', '\tlog.Fatalf("' },
    i(1, 'fatal: %v'),
    t '", err)',
    t { '', '}' },
  }),
  s('errr', {
    t { 'if err != nil {', '\treturn nil, fmt.Errorf("' },
    i(1, 'returning error: %v'),
    t '", err)',
    t { '', '}' },
  }),
  s('errn', {
    t { 'if err != nil {', '\treturn err', '}' },
  }),
}
