local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
    s({trig = "cout", dscr = "std::cout << ... << std::endl;"},
      {t("std::cout << "), i(1, "1"), t(" << std::endl;")}),
    s({trig = "cerr", dscr = "std::cerr << ... << std::endl;"},
      {t("std::cerr << "), i(1, "error"), t(" << std::endl;")})
}

