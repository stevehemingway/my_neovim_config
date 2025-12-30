
return {
  -- 1️⃣ Copilot core (lazy‑loaded on first InsertEnter)
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },   -- we’ll use nvim‑cmp for suggestions
        panel = { enabled = false },        -- optional UI panel
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
