return {
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local configs = require("lspconfig.configs")
      -- Check if the config is already defined (useful when reloading this file)
      if not configs.sqf_lsp then
        configs.sqf_lsp = {
          default_config = {
            cmd = { "node", os.getenv("SQF_PATH"), "--stdio" },
            filetypes = { "sqf" },
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
}
