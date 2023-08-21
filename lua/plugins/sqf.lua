return {
  --[[
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local configs = require("lspconfig.configs")
      -- Check if the config is already defined (useful when reloading this file)
      if not configs.sqf_lsp then
        configs.sqf_lsp = {
          default_config = {
            cmd = { "node", "E:/project/sqf/sqf-language-rework/.out/extension/server/src/server.js", "--stdio" },
            filetypes = { "sqf", "sqc" },
            root_dir = function(fname)
              return require("lspconfig.util").find_git_ancestor(fname)
            end,
            settings = {},
          },
        }
      end
      require("lspconfig").sqf_lsp.setup({})
    end,
  },
  --]]
}
