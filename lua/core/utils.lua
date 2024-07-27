local M = {}
-- local merge_tb = vim.tbl_deep_extend

M.load_config = function()
  local config = require "core.default_config"
  -- local chadrc_path = vim.api.nvim_get_runtime_file("lua/custom/chadrc.lua", false)[1]
  --
  -- if chadrc_path then
  --   local chadrc = dofile(chadrc_path)
  --
  --   config.mappings = M.remove_disabled_keys(chadrc.mappings, config.mappings)
  --   config = merge_tb("force", config, chadrc)
  --   config.mappings.disabled = nil
  -- end

  return config
end

return M;
