return {
  {
    'nvim-orgmode/orgmode',
    event = 'VeryLazy',
    ft = { 'org' },
    config = function()
      -- Setup orgmode
      require('orgmode').setup({
        org_agenda_files = '~/notes/**/*',
        org_default_notes_file = '~/notes/refile.org',

        org_startup_folded = 'inherit',

        mappings = {
          global = {
            org_agenda = '<leader>oa',
            org_capture = '<leader>oc'
          },
        },

        org_capture_templates = {
          n = {
            description = 'quick (n)ote',
            template = '\n*** %<%Y-%m-%d> %<%A>\n**** %U\n\n%?\n',
            target = '~/notes/q_notes/q_%^{topic|%<%Y_%m_%d>}.org',
          },
          j = '(j)ournal',
          je = {
            description = '(e)vent',
            template = '\n\n** %<%H:%M>: %^{Relates to: |%a}\n%?\n',
            target = '~/notes/journal/%<%Y-%m>.org'
          },
          jy = {
            description = '(y)ank',
            template = '\n** %^{What is this: |%a} :snippet:\n%U\n\n%?\n\n```%^{source type: |}\n%x\n```',
            target = '~/notes/journal/%<%Y-%m>.org'
          },
          w = '(w)ork',
          ws = {
            description = 'day (s)tart',
            template =
            '** start\n\t:PROPERTIES:\n\t:CREATED: %U\n\t:location: %^{Where are we working today: |WFH}\n\t:END:\n\n*** TODO %?\n',
            target = '~/notes/💼 Work.org',
            datetree = true,
          },
          we = {
            description = 'day (e)nd',
            '** end\n%U\n\t:PROPERTIES:\n\t:hours: %^{Hours worked: |8}\n\t:END:\n ',
            target = '~/notes/💼 Work.org',
            datetree = true
          },
          wl = {
            description = '(l)og',
            template = '**** %^{Relates to: |%a} :log:\n%U\n\t:PROPERTIES:\n\t:project: %^{Project: |NA}\n\t:END:\n%?\n',
            target = '~/notes/💼 Work.org',
            datetree = true,
          },
          wn = {
            description = 'work (n)ote',
            template = '**** %^{Relates to: |%a} :note:\n%U\n\n%?\n',
            target = '~/notes/💼 Work.org',
            datetree = true,
          },
          wy = {
            description = '(y)ank',
            template = '\n** %^{What is this: |%a} :snippet:\n%U\n\n%?\n\n```%^{source type: |}\n%x\n```',
            target = '~/notes/💼 Work.org',
            datetree = true,
          },
          wp = '(p)roject',
          wpt = {
            description = 'project (t)ask',
            template =
            '** start\n\t:PROPERTIES:\n\t:CREATED: %U\n\t:location: %^{Where are we working today: |WFH}\n\t:END:\n\n*** TODO %?\n',
            target = '~/notes/💼 Work.org',
            datetree = true,
          },
        },
        -- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
        -- add ~org~ to ignore_install
        -- require('nvim-treesitter.configs').setup({
        --   ensure_installed = 'all',
        --   ignore_install = { 'org' },
        -- })
      })
    end,
  },
  {
    "nvim-orgmode/telescope-orgmode.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-orgmode/orgmode",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("telescope").load_extension("orgmode")

      vim.keymap.set("n", "<leader>r", require("telescope").extensions.orgmode.refile_heading)
      vim.keymap.set("n", "<leader>fh", require("telescope").extensions.orgmode.search_headings)
      vim.keymap.set("n", "<leader>li", require("telescope").extensions.orgmode.insert_link)
    end,
  },
  require 'cmp'.setup({
    sources = {
      { name = 'orgmode' }
    }
  })
}

-- local M = {}
-- local terminals = {}
--
-- function M.create_properties() {
--   --@type string
--
--
--
-- }
