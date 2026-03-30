local ls = require 'luasnip'
local s = ls.snippet
local f = ls.function_node

return {
  s('now', {
    f(function()
      return os.date '%H:%M:%S'
    end),
  }),
}
