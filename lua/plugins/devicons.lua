return {
  "nvim-tree/nvim-web-devicons",
  opts = function(_, opts)
    local nwd = require("nvim-web-devicons")
    opts.sources = nwd.set_icon({
      sqf = {
        icon = "",
        color = "#428850",
        cterm_color = "65",
        name = "SQF",
      },
    })
  end,
}
