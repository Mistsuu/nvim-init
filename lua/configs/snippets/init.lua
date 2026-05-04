local cwd = debug.getinfo(1, "S").source:sub(2):match("(.*/)")
require("luasnip.loaders.from_snipmate").lazy_load({
  paths = cwd,
  override_priority = 1000,
})

