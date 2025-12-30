# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal Neovim configuration using lazy.nvim as the plugin manager. The configuration is structured with a modular Lua setup that separates concerns into config, keymaps, and plugin-specific files.

## Configuration Architecture

### Bootstrap Process (init.lua:2-13)
The configuration bootstraps lazy.nvim automatically if not present, cloning from GitHub. This happens before any other configuration loads.

### Loading Order
1. `config/options.lua` - Global editor options loaded first (init.lua:16)
2. lazy.nvim plugin setup - Loads all modules from `lua/plugins/` directory (init.lua:19)
3. Colorscheme application - Currently set to "koehler" (init.lua:43)
4. `keymaps.lua` - Loaded after plugins to ensure dependencies are available (init.lua:46)

### Plugin Organization

All plugins are defined as separate Lua files in `lua/plugins/` that return lazy.nvim plugin specifications. Each file configures one or more related plugins:

- **lsp.lua**: LSP client configuration using nvim-lspconfig
  - Configured servers: `pyright` (Python), `ts_ls` (TypeScript/JavaScript)
  - To add a new language server, add an entry to the `servers` table (lsp.lua:12-39)

- **completion.lua**: nvim-cmp autocompletion with LuaSnip
  - Sources: LSP, snippets, buffer, path, cmdline
  - Custom kind icons with Nerd Font symbols

- **telescope.lua**: Fuzzy finder with fzf-native extension
  - Ignores: node_modules, .git, binary files

- **treesitter.lua**: Syntax highlighting and code understanding
  - Auto-installed parsers: python, latex, markdown, ledger, lua, vim, javascript, typescript

- **formatting.lua**: none-ls (null-ls fork) for formatting and linting
  - Python: black, isort formatters; pylint linter
  - Auto-formats on save via BufWritePre autocmd (formatting.lua:35-41)
  - Note: augroup creation is misplaced (formatting.lua:47) - should be before null_ls.setup()

- **avante.lua**: Cursor-like AI coding assistant using Anthropic Claude
  - Provider: Claude (Sonnet 4)
  - Features: AI-driven code suggestions, inline diff application, sidebar interface
  - API key: Set `ANTHROPIC_API_KEY` environment variable
  - Build requirement: Requires `make` to compile (runs on plugin install/update)
  - Project-specific instructions: Create `avante.md` in project root for context

- **chatgpt.lua**: ChatGPT.nvim integration
  - API key retrieved via: `pass show openai/apikey`
  - Requires the `pass` password manager with this key stored

- **ui.lua**: UI enhancements (which-key, indent-blankline, vocal.nvim, gruvbox colorscheme)

- **trouble.lua**: Diagnostics list UI

- **autopairs.lua**: Auto-pairing brackets/quotes

### Keymap Structure (keymaps.lua)

All keymaps use which-key for discoverability. Keybindings are organized under leader key prefixes:

- `<leader>l*` - LSP operations (definition, references, hover, rename, etc.)
- `<leader>f*` - Telescope find operations (files, grep, buffers, help)
- `<leader>g*` - Git operations (via Telescope and Gitsigns)
- `<leader>t*` - Trouble diagnostics
- `<leader>c*` - ChatGPT commands (extensive submenu structure)
- `<leader>a*` - AI Assistant shortcuts (both Avante and ChatGPT)
  - `<leader>aa` - Avante Ask (open AI chat for selection/file)
  - `<leader>ar` - Avante Refresh (refresh AI response)
  - `<leader>av` - Avante Edit (edit with AI in visual mode)
  - `<leader>at` - Avante Toggle (toggle sidebar)
  - `<leader>ac` - ChatGPT (open ChatGPT chat)
  - `<leader>ae` - ChatGPT Edit (edit with instructions)
  - `<leader>ao` - Optimize Code
  - `<leader>af` - Fix Bugs
  - `<leader>ax` - Explain Code
- `[d` / `]d` - Previous/next diagnostic
- `[h` / `]h` - Previous/next git hunk

The ChatGPT integration has an elaborate keymap structure with submenus for code improvement, documentation, and text processing. A custom Telescope picker for ChatGPT actions is defined (keymaps.lua:147-191).

## Editor Options (config/options.lua)

Key settings:
- Tab width: 4 spaces (expandtab enabled)
- Line numbers: relative + absolute
- Persistent undo enabled with dedicated undodir
- No swap files, backups enabled but no writebackup
- Clipboard: system clipboard integration ("unnamedplus")
- Auto-wrapping disabled for code files via FileType autocmd (options.lua:62-67)
- Cursor position restoration on file reopen (options.lua:88-96)
- Auto-create parent directories on file save (options.lua:77-85)

## Development Commands

This is a configuration repository, not a development project. To test changes:

```bash
# Open Neovim (changes load automatically)
nvim

# Update plugins
nvim +Lazy

# Update Treesitter parsers
nvim +"TSUpdate" +qa

# Check LSP status
:LspInfo

# Check plugin status
:Lazy
```

## External Dependencies

The configuration requires several external tools to function fully:

### Language Servers
- `pyright` - Python LSP
- `typescript-language-server` - TypeScript/JavaScript LSP

### Formatters/Linters
- `black` - Python formatter
- `isort` - Python import sorter
- `pylint` - Python linter

### Other Tools
- `ripgrep` - Required by Telescope live_grep
- `fd` - Optional, improves Telescope find_files
- `pass` - Password manager for ChatGPT API key storage
- `make` - Required to build telescope-fzf-native and avante.nvim extensions
- `cargo` OR `curl`/`tar` - Required for building avante.nvim

### AI API Keys
- **Anthropic Claude**: Set `ANTHROPIC_API_KEY` environment variable for avante.nvim
  ```bash
  export ANTHROPIC_API_KEY="sk-ant-..."
  ```
- **OpenAI ChatGPT**: Stored in pass password manager at `openai/apikey`

### Installing LSP Servers

The configuration does not use mason.nvim. Language servers must be installed manually via system package manager or npm:

```bash
# Python
pip install pyright

# TypeScript/JavaScript
npm install -g typescript-language-server typescript
```

## Notable Customizations

1. **API Key Management**: ChatGPT plugin uses `pass show openai/apikey` to retrieve the API key securely from the pass password manager.

2. **Disabled Plugins**: Many built-in Vim plugins are explicitly disabled in options.lua:44-59 for performance.

3. **Custom Treesitter Languages**: Configuration includes less common parsers like `ledger` (accounting) and `latex`, suggesting use cases beyond typical programming.

4. **Autocmd Behavior**: Wrap is enabled globally but disabled for code files. Other autocmds handle yank highlighting, directory creation, and cursor position restoration.

5. **Formatting Bug**: In formatting.lua, the `augroup` variable is referenced before definition (line 34), then defined after setup (line 47). This should be moved before the null_ls.setup() call to avoid potential nil reference errors.
