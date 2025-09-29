# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

### Neovim Basics

- Start Neovim: `nvim`
- Install plugins automatically with Lazy (headless): `nvim --headless "+Lazy! sync" +qa`
- Format code: `<leader>f` in normal or visual mode
- Check LSP server status: `:LspInfo`
- Mason package manager: `:Mason`

### Configuration Commands

- Check Neovim health: `:checkhealth`
- Show Lazy plugin status: `:Lazy`
- Show LSP information: `:LspInfo`
- View loaded plugins: `:scriptnames`

## Architecture

This Neovim configuration is built on the kickstart.nvim framework, with customizations organized in modular files. Here's an overview of the structure:

### Core Components

- **init.lua**: Main configuration entry point that sets up the plugin manager (lazy.nvim) and loads plugins
- **lua/custom/plugins/**: Directory containing user-specific plugin configurations
- **lua/kickstart/plugins/**: Core plugins and default configurations from kickstart.nvim

### Key Customizations

1. **Plugin Management**:
   - Uses lazy.nvim for plugin management
   - Core plugins defined in init.lua
   - Custom plugins loaded from lua/custom/plugins/ directory

2. **LSP Configuration**:
   - Language servers installed and managed through Mason
   - Configured in init.lua with custom server settings
   - Supports autocompletion with nvim-cmp

3. **UI and Experience**:
   - Uses Gruvbox theme with transparency settings
   - Customized statusline via mini.statusline
   - Which-key for keybinding visualization
   - Notification system via nvim-notify

4. **Custom Features**:
   - Tmux integration for seamless navigation between Neovim and tmux panes
   - Enhanced yanking and clipboard management via yanky.nvim
   - Text case conversion utilities
   - Advanced Git integration with vim-fugitive

### Core Functionality

- **Code Intelligence**: LSP integration for autocompletion, diagnostics, and code navigation
- **Fuzzy Finding**: Telescope for file, text, and symbol searching
- **Syntax Highlighting**: Treesitter for advanced syntax highlighting and code parsing
- **Code Formatting**: Conform.nvim for automatic code formatting
- **Git Integration**: vim-fugitive and related plugins for Git operations
- **Markdown Preview**: Browser-based markdown preview with markdown-preview.nvim

## Code Navigation and Editing

- `<leader>sf`: Find files (Telescope)
- `<leader>sg`: Live grep (Telescope) 
- `<leader>sh`: Search help
- `gd`: Go to definition
- `<leader>rn`: Rename symbol
- `<leader>ca`: Code actions
- `<leader>/`: Fuzzy find in current buffer
- `<leader>mp`: Toggle Markdown preview

## Tmux Integration

The configuration includes seamless navigation between Neovim and Tmux using Alt+arrow keys:
- `Alt+left/down/up/right`: Navigate between Neovim splits and Tmux panes
- `Alt+\`: Navigate to last active split/pane
- `Alt+Space`: Navigate to next split/pane