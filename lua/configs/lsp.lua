local _ = {}

_.server_configurations = {
  -- add more servers & configurations here
  -- the rules are mine, so don't look into
  -- some documentations for this. 
  -- {
  --    "<name>",
  --    opts = < configs to be used with vim.lsp.config, or function that returns that config >
  {
    "*",
    opts = function ()
      local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
      return {
        capabilities = lsp_capabilities
      }
    end
  },
  { "lua_ls" },
  { "ruff" },
  { "ts_ls" },
  { "clangd" },
  {
    "basedpyright",
    opts = {
      analysis = {
        typeCheckingMode = "basic",
      }
    }
  },
}

-- more configurations here
vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = { current_line = true },
})

---------------------------------------------------------------------------------------

-- sanity check
local parse_configurations = function()
  local servers = {}

  if type(_.server_configurations) ~= "table" then
    error("configs.lsp.server_configurations must be an array")
  end

  for i, configuration in ipairs(_.server_configurations) do
    local config_name = configuration[1]
    local config_opts = configuration.opts

    if type(config_name) ~= "string" then
      error("configs.lsp.server_configurations[" .. tostring(i) .. "][1] must be a string")
    end

    if config_opts ~= nil and type(config_opts) ~= "table" and type(config_opts) ~= "function" then
      error("configs.lsp.server_configurations[" .. tostring(i) .. "].opts must be a table or function or nil")
    end

    if config_name ~= "*" then
      table.insert(servers, config_name)
    end
  end

  return servers
end

_.servers = parse_configurations()

-- exported function to be used when loading
-- plugins
_.register_servers = function()
  for i, configuration in ipairs(_.server_configurations) do
    local config_name = configuration[1]
    local config_opts = configuration.opts

    -- if opts is a function, run it first
    if type(config_opts) == "function" then
      config_opts = config_opts()
      if type(config_opts) ~= "table" then
        error("configs.lsp.server_configurations[" .. tostring(i) .. "].opts() must be a table")
      end
    end

    if config_opts ~= nil then
      vim.lsp.config(config_name, config_opts)
    end
    
    -- "*" is a special case
    if config_name ~= "*" then
      vim.lsp.enable(config_name)
    end
  
  end
end

return _

