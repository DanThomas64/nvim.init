return {
    {
        'nvim-orgmode/orgmode',
        event = 'VeryLazy',
        ft = { 'org' },
        dependencies = { 'akinsho/org-bullets.nvim',
            'andreadev-it/orgmode-multi-key',
            'massix/org-checkbox.nvim',
        },
        config = function()
            require('orgcheckbox').setup({ lhs = '<leader>oT' })
            require('orgmode-multi-key').setup({ key = '<leader><CR>' })
            -- Setup orgmode
            require('orgmode').setup({
                -- Locations setups
                org_agenda_files = '~/notes/**/*',
                org_default_notes_file = '~/notes/⁉️ To Organize.org',
                org_archive_location = '~/notes/archive/%s_archive::',
                -- Keywords to keep consistent with orgzly
                org_todo_keywords = { 'TODO(t)', 'NEXT(n)', 'ENTER(e)', 'QUESTION(q)', '|', 'ANSWERED(y)', 'DONE(d)' },
                -- Indentation settings
                org_adapt_indentation = false,
                -- Folding settings
                org_startup_folded = 'inherit',
                -- New blank line before new entry
                org_blank_before_new_entry = { heading = true, plain_list_item = false },
                -- custom mappings
                mappings = {
                    global = {
                        org_agenda = '<leader>oa',
                        org_capture = '<leader>oc',
                    },
                    org = {
                        org_toggle_heading = '<leader>oh',
                    }
                },

                org_capture_templates = {
                    n = '(n)note',
                    nn = {
                        description = '(q)uick',
                        template = '**** %^{Relates to: |%a} :note:\n:PROPERTIES:\n:CREATED: %U\n:END:\n\n%?\n\n',
                        target = '~/notes/⁉️ To Organize.org',
                        properties = { empty_lines = { before = 1 }, { after = 0 } },
                        headline = '📥 Inbox'

                    },
                    nf = {
                        description = 'in (f)ile',
                        template = '*** %^{Relates to: |%a} :note:\n:PROPERTIES:\n:CREATED: %U\n:END:\n\n%?\n\n',
                        target = '%F',
                        properties = { empty_lines = { before = 1 }, { after = 0 } },
                        headline = 'Notes',
                    },
                    j = '(j)ournal',
                    je = {
                        description = '(e)vent',
                        template = '**** [%^{Event description: |log}]\n:PROPERTIES:\n:CREATED: %U\n:END:\n\n%?\n\n',
                        target = '~/notes/📓 %<%Y-%m>.org',
                        properties = { empty_lines = { before = 1 }, { after = 0 } },
                    },
                    jy = {
                        description = '(y)ank',
                        template =
                        '\n** %^{What is this: |%a}\n:PROPERTIES:\n:CREATED: %U\n:END:\n\n%?\n\n```%^{source type: |}\n%x\n```\n\n',
                        target = '~/notes/📓 %<%Y-%m>.org',
                        properties = { empty_lines = { before = 1 }, { after = 0 } },
                    },
                    --
                    -- Nothing below this line means shit for orgzly
                    --
                    w = '(w)ork',
                    ws = {
                        description = 'day (s)tart',
                        template =
                        '** START OF DAY\n:PROPERTIES:\n:CREATED: %U\n:location: %^{Where are we working today: |WFH}\n:END:\n\n*** TODO %?\n\n',
                        target = '~/notes/💼 Work.org',
                        datetree = true,
                        properties = { empty_lines = { before = 1 }, { after = 0 } },
                    },
                    we = {
                        description = 'day (e)nd',
                        '** END OF DAY\n%U\n\n ',
                        target = '~/notes/💼 Work.org',
                        datetree = true,
                        properties = { empty_lines = { before = 1 }, { after = 0 } },
                    },
                    wn = {
                        description = 'work (n)ote',
                        template = '**** %^{Relates to: |%a} :note:\n:PROPERTIES:\n:CREATED: %U\n:END:\n\n%?\n\n',
                        target = '~/notes/💼 Work.org',
                        datetree = true,
                        properties = { empty_lines = { before = 1 }, { after = 0 } },
                    },
                    wy = {
                        description = '(y)ank',
                        template = '\n** %^{What is this: |%a}\n%U\n\n%?\n\n```%^{source type: |}\n%x\n```\n\n',
                        target = '~/notes/💼 Work.org',
                        datetree = true,
                        properties = { empty_lines = { before = 1 }, { after = 0 } },
                    },
                },
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
