require("neoconf").setup()
local lspconfig = require("lspconfig")
local configs = require("lspconfig.configs")
-- Check if the config is already defined (useful when reloading this file)
if not configs.sqf_lsp then
  configs.sqf_lsp = {
    default_config = {
      cmd = { "node", "C:/sqf-language-rework/.out/extension/server/src/server.js", "--stdio" },
      filetypes = { "sqf" },
      root_dir = function(fname)
        return lspconfig.util.find_git_ancestor(fname)
      end,
      settings = {},
    },
  }
end
require("lspconfig").sqf_lsp.setup({})
