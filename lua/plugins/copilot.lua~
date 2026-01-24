
return {
  -- 1️⃣ Copilot core (lazy‑loaded on first InsertEnter)
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = false,
          auto_trigger = false,
          debounce = 75,
          keymap = {
            accept = "<M-l>",      -- Alt+l to accept suggestion
            accept_word = "<M-w>", -- Alt+w to accept word
            accept_line = "<M-j>", -- Alt+j to accept line
            next = "<M-]>",        -- Alt+] for next suggestion
            prev = "<M-[>",        -- Alt+[ for previous suggestion
            dismiss = "<C-]>",     -- Ctrl+] to dismiss
          },
        },
        panel = {
          enabled = false,
          auto_refresh = false,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-CR>",  -- Alt+Enter to open panel
          },
          layout = {
            position = "bottom",
            ratio = 0.4,
          },
        },
        filetypes = {
          yaml = true,
          markdown = true,
          help = false,
          gitcommit = true,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ["."] = false,
        },
      })
    end,
  },

  -- 2️⃣ Copilot → nvim‑cmp source
  {
    "zbirenbaum/copilot-cmp",
    event = "InsertEnter",
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },
}
