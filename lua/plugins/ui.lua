return {
 -- Which-key for keybinding discovery
 {
 "folke/which-key.nvim",
 event = "VeryLazy",
 opts = {
 preset = "modern",
 delay =500,
 expand =1,
 notify = true,
 triggers = {
 { "<auto>", mode = "nixsotc" },
 { "<leader>", mode = { "n", "v" } },
 },
 },
 keys = {
 {
 "<leader>?",
 function()
 require("which-key").show({ global = false })
 end,
 desc = "Buffer Local Keymaps (which-key)",
 },
 },
 },
  
 -- Indent guides
 {
 "lukas-reineke/indent-blankline.nvim",
 event = { "BufReadPost", "BufNewFile" },
 main = "ibl",
 opts = {
 indent = {
 char = "│",
 tab_char = "│",
 },
 scope = {
 enabled = true,
 show_start = true,
 show_end = true,
 injected_languages = false,
 highlight = { "Function", "Label" },
 priority =500,
 },
 exclude = {
 filetypes = {
 "help",
 "alpha",
 "dashboard",
 "neo-tree",
 "Trouble",
 "trouble",
 "lazy",
 "mason",
 "notify",
 "toggleterm",
 "lazyterm",
 },
 },
 },
 },
  
 -- Voice transcription
 {
 "kyza0d/vocal.nvim",
 dependencies = {
 "nvim-lua/plenary.nvim",
 },
 cmd = "Vocal",
 keys = {
 { "<leader>v", "<cmd>Vocal<cr>", desc = "Voice Transcription" },
 },
 opts = {
 api_key = nil,
 recording_dir = os.getenv("HOME") .. "/recordings",
 delete_recordings = true,
 keymap = "<leader>v",
 local_model = nil,
 api = {
 model = "whisper-1",
 language = "en",
 response_format = "json",
 temperature =0,
 timeout =60,
 },
 },
 },
 {
 "ellisonleao/gruvbox.nvim",
 priority = 1000, -- Load gruvbox before other plugins
 config = function()
 require("gruvbox").setup({
 -- your gruvbox config here
 })
 end,
 },
}
