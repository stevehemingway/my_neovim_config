-- Keymaps configuration
local wk = require("which-key")

-- LSP keybindings
wk.add({
  { "<leader>l", group = "LSP" },
  { "<leader>ld", vim.lsp.buf.definition, desc = "Go to Definition" },
  { "<leader>lD", vim.lsp.buf.declaration, desc = "Go to Declaration" },
  { "<leader>li", vim.lsp.buf.implementation, desc = "Go to Implementation" },
  { "<leader>lt", vim.lsp.buf.type_definition, desc = "Go to Type Definition" },
  { "<leader>lr", vim.lsp.buf.references, desc = "Find References" },
  { "<leader>lh", vim.lsp.buf.hover, desc = "Show Hover Info" },
  { "<leader>ls", vim.lsp.buf.signature_help, desc = "Show Signature Help" },
  { "<leader>ln", vim.lsp.buf.rename, desc = "Rename Symbol" },
  { "<leader>la", vim.lsp.buf.code_action, desc = "Code Actions" },
  { "<leader>lf", vim.lsp.buf.format, desc = "Format Document" },
  { "<leader>le", vim.diagnostic.open_float, desc = "Show Diagnostics" },
  { "[d", vim.diagnostic.goto_prev, desc = "Previous Diagnostic" },
  { "]d", vim.diagnostic.goto_next, desc = "Next Diagnostic" },
})

-- Telescope keybindings
wk.add({
  { "<leader>f", group = "Find" },
  { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
  { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
  { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },
  { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find Help" },
  { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
  { "<leader>fc", "<cmd>Telescope commands<cr>", desc = "Find Commands" },
  { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Find Keymaps" },
  { "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
  { "<leader>fS", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "Workspace Symbols" },
})

-- Git keybindings
wk.add({
  { "<leader>g", group = "Git" },
  { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Git Branches" },
  { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Git Commits" },
  { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Git Status" },
  { "<leader>gd", "<cmd>Gitsigns diffthis<cr>", desc = "Git Diff" },
  { "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview Hunk" },
  { "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", desc = "Reset Hunk" },
  { "<leader>gR", "<cmd>Gitsigns reset_buffer<cr>", desc = "Reset Buffer" },
  { "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<cr>", desc = "Undo Stage Hunk" },
  { "<leader>gS", "<cmd>Gitsigns stage_buffer<cr>", desc = "Stage Buffer" },
  { "[h", "<cmd>Gitsigns prev_hunk<cr>", desc = "Previous Hunk" },
  { "]h", "<cmd>Gitsigns next_hunk<cr>", desc = "Next Hunk" },
})

-- Trouble keybindings
wk.add({
  { "<leader>t", group = "Trouble" },
  { "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>", desc = "Toggle Trouble" },
  { "<leader>tw", "<cmd>Trouble workspace_diagnostics<cr>", desc = "Workspace Diagnostics" },
  { "<leader>td", "<cmd>Trouble document_diagnostics<cr>", desc = "Document Diagnostics" },
  { "<leader>tl", "<cmd>Trouble loclist<cr>", desc = "Location List" },
  { "<leader>tq", "<cmd>Trouble quickfix<cr>", desc = "Quickfix List" },
  { "<leader>tr", "<cmd>Trouble lsp_references<cr>", desc = "LSP References" },
})

-- ChatGPT keybindings
wk.add({
  { "<leader>c", group = "ChatGPT" },
  { "<leader>cc", "<cmd>ChatGPT<CR>", desc = "Open Chat", mode = "n" },
  { "<leader>ce", "<cmd>ChatGPTEditWithInstruction<CR>", desc = "Edit with Instructions", mode = { "n", "v" } },
  { "<leader>cq", "<cmd>ChatGPTActAs<CR>", desc = "Act As Role", mode = "n" },
  
  { "<leader>ci", group = "Code Improvement" },
  { "<leader>cio", "<cmd>ChatGPTRun optimize_code<CR>", desc = "Optimize Code", mode = { "n", "v" } },
  { "<leader>cif", "<cmd>ChatGPTRun fix_bugs<CR>", desc = "Fix Bugs", mode = { "n", "v" } },
  { "<leader>ciR", "<cmd>ChatGPTRun refactor_code<CR>", desc = "Refactor Code", mode = { "n", "v" } },
  { "<leader>cir", "<cmd>ChatGPTRun code_readability_analysis<CR>", desc = "Readability Analysis", mode = { "n", "v" } },
  
  { "<leader>cd", group = "Documentation" },
  { "<leader>cdx", "<cmd>ChatGPTRun explain_code<CR>", desc = "Explain Code", mode = { "n", "v" } },
  { "<leader>cdt", "<cmd>ChatGPTRun add_tests<CR>", desc = "Add Tests", mode = { "n", "v" } },
  { "<leader>cdd", "<cmd>ChatGPTRun add_docstring<CR>", desc = "Add Docstring", mode = { "n", "v" } },
  { "<leader>cds", "<cmd>ChatGPTRun summarize<CR>", desc = "Summarize", mode = { "n", "v" } },
  
  { "<leader>ct", group = "Text Processing" },
  { "<leader>ctg", "<cmd>ChatGPTRun grammar_correction<CR>", desc = "Grammar Correction", mode = { "n", "v" } },
  { "<leader>ctk", "<cmd>ChatGPTRun keywords<CR>", desc = "Extract Keywords", mode = { "n", "v" } },
  { "<leader>ctt", "<cmd>ChatGPTRun translate<CR>", desc = "Translate", mode = { "n", "v" } },
  
  { "<leader>co", "<cmd>ChatGPTRun optimize_code<CR>", desc = "Quick Optimize", mode = { "n", "v" } },
  { "<leader>cf", "<cmd>ChatGPTRun fix_bugs<CR>", desc = "Quick Fix", mode = { "n", "v" } },
  { "<leader>cx", "<cmd>ChatGPTRun explain_code<CR>", desc = "Quick Explain", mode = { "n", "v" } },
  
  { "<F12>", "<cmd>ChatGPT<CR>", desc = "ChatGPT", mode = "n" },
  { "<F11>", "<cmd>ChatGPTEditWithInstruction<CR>", desc = "Edit with Instructions", mode = "v" },
})

-- AI Assistant prefix (includes ChatGPT, Avante, Copilot, and Gp.nvim)
wk.add({
  { "<leader>a", group = "AI Assistant" },
  -- Avante keybindings (defined in plugins/avante.lua)
  -- <leader>aa - Avante Ask
  -- <leader>ar - Avante Refresh
  -- <leader>av - Avante Edit (visual mode)
  -- <leader>at - Avante Toggle
  -- ChatGPT shortcuts
  { "<leader>ac", "<cmd>ChatGPT<CR>", desc = "ChatGPT", mode = "n" },
  { "<leader>ae", "<cmd>ChatGPTEditWithInstruction<CR>", desc = "ChatGPT Edit", mode = { "n", "v" } },
  { "<leader>ao", "<cmd>ChatGPTRun optimize_code<CR>", desc = "Optimize Code", mode = { "n", "v" } },
  { "<leader>af", "<cmd>ChatGPTRun fix_bugs<CR>", desc = "Fix Bugs", mode = { "n", "v" } },
  { "<leader>ax", "<cmd>ChatGPTRun explain_code<CR>", desc = "Explain Code", mode = { "n", "v" } },
  -- Gp.nvim (Kimi K2) shortcuts
  { "<leader>ak", "<cmd>GpChatNew<CR>", desc = "Kimi Chat", mode = { "n", "v" } },
  { "<leader>ag", "<cmd>GpChatToggle<CR>", desc = "Toggle Kimi Chat", mode = { "n", "v" } },
  { "<leader>aw", "<cmd>GpRewrite<CR>", desc = "Kimi Rewrite", mode = { "n", "v" } },
})

-- Copilot keybindings
wk.add({
  { "<leader>p", group = "Copilot" },
  { "<leader>pe", "<cmd>Copilot enable<CR>", desc = "Enable Copilot", mode = "n" },
  { "<leader>pd", "<cmd>Copilot disable<CR>", desc = "Disable Copilot", mode = "n" },
  { "<leader>ps", "<cmd>Copilot status<CR>", desc = "Copilot Status", mode = "n" },
  { "<leader>pa", "<cmd>Copilot auth<CR>", desc = "Authenticate Copilot", mode = "n" },
  { "<leader>pv", "<cmd>Copilot version<CR>", desc = "Copilot Version", mode = "n" },
  { "<leader>pp", "<cmd>Copilot panel<CR>", desc = "Open Panel", mode = "n" },
  {
    "<leader>pt",
    function()
      local copilot = require("copilot.suggestion")
      if copilot.is_visible() then
        copilot.dismiss()
      else
        copilot.next()
      end
    end,
    desc = "Toggle Suggestion",
    mode = "i"
  },
})

-- Copilot inline suggestion keybindings (Insert mode)
-- Note: These are configured in the plugin setup (copilot.lua) but documented here:
-- <M-l>   - Accept suggestion (Alt+l)
-- <M-w>   - Accept word (Alt+w)
-- <M-j>   - Accept line (Alt+j)
-- <M-]>   - Next suggestion (Alt+])
-- <M-[>   - Previous suggestion (Alt+[)
-- <C-]>   - Dismiss suggestion (Ctrl+])
-- <M-CR>  - Open Copilot panel (Alt+Enter)

-- Gp.nvim (Kimi K2) keybindings
wk.add({
  { "<leader>k", group = "Kimi AI (Gp.nvim)" },
  { "<leader>kc", "<cmd>GpChatNew<CR>", desc = "New Chat", mode = { "n", "v" } },
  { "<leader>kt", "<cmd>GpChatToggle<CR>", desc = "Toggle Chat", mode = { "n", "v" } },
  { "<leader>kf", "<cmd>GpChatFinder<CR>", desc = "Find Chats", mode = "n" },
  { "<leader>kr", "<cmd>GpRewrite<CR>", desc = "Rewrite Selection", mode = { "n", "v" } },
  { "<leader>ka", "<cmd>GpAppend<CR>", desc = "Append Response", mode = { "n", "v" } },
  { "<leader>kp", "<cmd>GpPrepend<CR>", desc = "Prepend Response", mode = { "n", "v" } },
  { "<leader>ke", "<cmd>GpEnew<CR>", desc = "New Buffer", mode = { "n", "v" } },
  { "<leader>kn", "<cmd>GpNew<CR>", desc = "New Window", mode = { "n", "v" } },
  { "<leader>kv", "<cmd>GpVnew<CR>", desc = "New Vsplit", mode = { "n", "v" } },
  { "<leader>kT", "<cmd>GpTabnew<CR>", desc = "New Tab", mode = { "n", "v" } },
  { "<leader>ks", "<cmd>GpStop<CR>", desc = "Stop Response", mode = { "n", "v" } },
  { "<leader>kx", "<cmd>GpContext<CR>", desc = "Show Context", mode = { "n", "v" } },
  { "<leader>kN", "<cmd>GpNextAgent<CR>", desc = "Next Agent", mode = "n" },
  { "<leader>ki", "<cmd>GpAgent<CR>", desc = "Show Agent Info", mode = "n" },
  -- Whisper voice commands (requires sox)
  { "<leader>kw", group = "Whisper Voice" },
  { "<leader>kww", "<cmd>GpWhisper<CR>", desc = "Record & Transcribe", mode = { "n", "v" } },
  { "<leader>kwr", "<cmd>GpWhisperRewrite<CR>", desc = "Record & Rewrite", mode = { "n", "v" } },
  { "<leader>kwa", "<cmd>GpWhisperAppend<CR>", desc = "Record & Append", mode = { "n", "v" } },
  { "<leader>kwp", "<cmd>GpWhisperPrepend<CR>", desc = "Record & Prepend", mode = { "n", "v" } },
  { "<leader>kwe", "<cmd>GpWhisperEnew<CR>", desc = "Record to New Buffer", mode = { "n", "v" } },
  { "<leader>kwn", "<cmd>GpWhisperNew<CR>", desc = "Record to New Window", mode = { "n", "v" } },
  { "<leader>kwv", "<cmd>GpWhisperVnew<CR>", desc = "Record to New Vsplit", mode = { "n", "v" } },
  { "<leader>kwt", "<cmd>GpWhisperTabnew<CR>", desc = "Record to New Tab", mode = { "n", "v" } },
})

-- Word count keybinding
wk.add({
  { "<leader>w", group = "Word Operations" },
  {
    "<leader>wc",
    function()
      local word_count = vim.fn.wordcount()
      local count = word_count.words
      local visual_count = word_count.visual_words

      if visual_count then
        vim.notify(string.format("Selected: %d words", visual_count), vim.log.levels.INFO)
      else
        vim.notify(string.format("Buffer: %d words", count), vim.log.levels.INFO)
      end
    end,
    desc = "Count Words",
    mode = { "n", "v" }
  },
})

-- Custom ChatGPT prompts
local preset_prompts = {
  security = "Review this code for security vulnerabilities and suggest improvements",
  performance = "Analyze this code for performance bottlenecks and suggest optimizations",
  cleanup = "Clean up this code, remove redundancy, and improve readability",
  error_handling = "Add proper error handling to this code",
  logging = "Add appropriate logging statements to this code",
  comments = "Add clear, helpful comments to explain this code",
}

wk.add({
  { "<leader>cp", group = "Custom Prompts" },
  { 
    "<leader>cpc", 
    function()
      vim.ui.input({ prompt = "Custom ChatGPT Prompt: " }, function(input)
        if input and input ~= "" then
          vim.cmd("ChatGPTRun " .. input)
        end
      end)
    end, 
    desc = "Custom Prompt", 
    mode = { "n", "v" } 
  },
})

-- Add preset prompts
local preset_keys = {}
for key, prompt in pairs(preset_prompts) do
  table.insert(preset_keys, {
    "<leader>cp" .. key:sub(1, 1),
    function()
      vim.cmd("ChatGPTEditWithInstruction " .. prompt)
    end,
    desc = key:gsub("_", " "):gsub("^%l", string.upper),
    mode = { "n", "v" }
  })
end

wk.add(preset_keys)

-- Telescope ChatGPT picker
local function create_chatgpt_picker()
  if pcall(require, "telescope") then
    local pickers = require("telescope.pickers")
    local finders = require("telescope.finders")
    local conf = require("telescope.config").values
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")
    
    local chatgpt_actions = {
      { "optimize_code", "Optimize Code" },
      { "fix_bugs", "Fix Bugs" },
      { "explain_code", "Explain Code" },
      { "add_tests", "Add Tests" },
      { "add_docstring", "Add Docstring" },
      { "refactor_code", "Refactor Code" },
      { "code_readability_analysis", "Code Readability Analysis" },
      { "summarize", "Summarize" },
      { "grammar_correction", "Grammar Correction" },
      { "keywords", "Extract Keywords" },
    }
    
    pickers.new({}, {
      prompt_title = "ChatGPT Actions",
      finder = finders.new_table({
        results = chatgpt_actions,
        entry_maker = function(entry)
          return {
            value = entry[1],
            display = entry[2],
            ordinal = entry[2],
          }
        end,
      }),
      sorter = conf.generic_sorter({}),
      attach_mappings = function(prompt_bufnr, map)
        actions.select_default:replace(function()
          actions.close(prompt_bufnr)
          local selection = action_state.get_selected_entry()
          vim.cmd("ChatGPTRun " .. selection.value)
        end)
        return true
      end,
    }):find()
  end
end

wk.add({
  { "<leader>cs", create_chatgpt_picker, desc = "Select ChatGPT Action", mode = { "n", "v" } },
})