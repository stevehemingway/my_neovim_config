return {
  "robitx/gp.nvim",
  config = function()
    local conf = {
      providers = {
        groq = {
          endpoint = "https://api.groq.com/openai/v1/chat/completions",
          secret = os.getenv("GROQ_API_KEY"),
        },
      },

      agents = {
        {
          provider = "groq",
          name = "KimiK2",
          chat = true,
          command = true,
          model = {
            model = "moonshotai/kimi-k2-instruct-0905",
            temperature = 0.8,
            top_p = 1,
          },
          system_prompt = require("gp.defaults").chat_system_prompt,
        },
      },

      -- Set KimiK2 as the default agent for new chats
      default_chat_agent = "KimiK2",

      chat_dir = vim.fn.stdpath("data") .. "/gp/chats",
      chat_user_prefix = "💬:",
      chat_assistant_prefix = { "🤖:", "[{{agent}}]" },
      chat_topic_gen_prompt = "Summarize the topic of our conversation above"
        .. " in two or three words. Respond only with those words.",
      chat_confirm_delete = true,
      chat_conceal_model_params = true,
      chat_shortcut_respond = { modes = { "n", "i", "v", "x" }, shortcut = "<C-g><C-g>" },
      chat_shortcut_delete = { modes = { "n", "i", "v", "x" }, shortcut = "<C-g>d" },
      chat_shortcut_stop = { modes = { "n", "i", "v", "x" }, shortcut = "<C-g>s" },
      chat_shortcut_new = { modes = { "n", "i", "v", "x" }, shortcut = "<C-g>c" },

      command_prompt_prefix_template = "🤖 {{agent}} ~ ",
      command_auto_select_response = true,

      toggle_target = "vsplit",
      style_chat_finder_border = "single",
      style_popup_border = "single",

      -- Whisper speech-to-text configuration (requires sox)
      whisper = {
        disable = false,
        endpoint = "https://api.openai.com/v1/audio/transcriptions",
        store_dir = (os.getenv("TMPDIR") or os.getenv("TEMP") or "/tmp") .. "/gp_whisper",
        silence = "1.75", -- Multiplier for silence detection threshold
        tempo = "1.75", -- Speed up audio to reduce costs (1.75x)
        language = "en",
        rec_cmd = nil, -- Auto-detect (will use sox, arecord, or ffmpeg)
      },

      -- Keybindings are defined in keymaps.lua
    }

    require("gp").setup(conf)

    -- Extend builtin actions with custom hooks
    local function keymapOptions(desc)
      return {
        noremap = true,
        silent = true,
        nowait = true,
        desc = "GPT prompt " .. desc,
      }
    end

    -- Example custom commands (optional)
    -- vim.keymap.set({"n", "i"}, "<C-g>t", "<cmd>GpChatNew tabnew<cr>", keymapOptions("New Chat tabnew"))
    -- vim.keymap.set("v", "<C-g>t", ":<C-u>'<,'>GpChatNew tabnew<cr>", keymapOptions("Visual Chat New tabnew"))
  end,
}
