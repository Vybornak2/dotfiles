# Plugin Wiki

This page maps active plugins/extensions in this repo to their canonical docs and wiki pages.

## Zsh plugins and theme

Source: `.zshrc`, `scripts/modules/30-tools-zsh.sh`

| Plugin/Theme | Purpose | Reference |
|---|---|---|
| Oh My Zsh (`git`, `python`, `sudo`, `zoxide` plugins) | Shell framework and plugin host | <https://github.com/ohmyzsh/ohmyzsh/wiki> |
| Powerlevel10k | Prompt theme | <https://github.com/romkatv/powerlevel10k#readme> |
| zsh-autosuggestions | Command suggestions from history | <https://github.com/zsh-users/zsh-autosuggestions#readme> |
| zsh-syntax-highlighting | Syntax highlighting in command line | <https://github.com/zsh-users/zsh-syntax-highlighting#readme> |
| zoxide | Smarter `cd` navigation | <https://github.com/ajeetdsouza/zoxide#readme> |

## Neovim plugin manager and ecosystem

Source: `nvim/init.lua`

| Plugin | Purpose | Wiki/Docs |
|---|---|---|
| `folke/lazy.nvim` | Plugin manager | <https://lazy.folke.io/> |
| `NMAC427/guess-indent.nvim` | Detect indentation settings | <https://github.com/NMAC427/guess-indent.nvim> |
| `lewis6991/gitsigns.nvim` | Git gutter signs/hunk actions | <https://github.com/lewis6991/gitsigns.nvim> |
| `folke/which-key.nvim` | Keymap popup hints | <https://github.com/folke/which-key.nvim> |
| `nvim-telescope/telescope.nvim` | Fuzzy search UI | <https://github.com/nvim-telescope/telescope.nvim> |
| `nvim-telescope/telescope-fzf-native.nvim` | Native sorter for Telescope | <https://github.com/nvim-telescope/telescope-fzf-native.nvim> |
| `nvim-telescope/telescope-ui-select.nvim` | UI-select extension for Telescope | <https://github.com/nvim-telescope/telescope-ui-select.nvim> |
| `nvim-lua/plenary.nvim` | Lua utility dependency | <https://github.com/nvim-lua/plenary.nvim> |
| `nvim-tree/nvim-web-devicons` | Filetype icons | <https://github.com/nvim-tree/nvim-web-devicons> |
| `neovim/nvim-lspconfig` | LSP client config helpers | <https://github.com/neovim/nvim-lspconfig> |
| `mason-org/mason.nvim` | Install/manage LSPs/formatters | <https://github.com/mason-org/mason.nvim> |
| `mason-org/mason-lspconfig.nvim` | Bridge between Mason and lspconfig | <https://github.com/mason-org/mason-lspconfig.nvim> |
| `WhoIsSethDaniel/mason-tool-installer.nvim` | Declarative Mason tool installs | <https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim> |
| `j-hui/fidget.nvim` | LSP status updates | <https://github.com/j-hui/fidget.nvim> |
| `stevearc/conform.nvim` | Formatter orchestration | <https://github.com/stevearc/conform.nvim> |
| `saghen/blink.cmp` | Completion engine | <https://github.com/Saghen/blink.cmp> |
| `L3MON4D3/LuaSnip` | Snippet engine | <https://github.com/L3MON4D3/LuaSnip> |
| `folke/tokyonight.nvim` | Colorscheme | <https://github.com/folke/tokyonight.nvim> |
| `folke/todo-comments.nvim` | Highlight TODO/FIXME-like notes | <https://github.com/folke/todo-comments.nvim> |
| `nvim-mini/mini.nvim` | Mini plugin collection (ai/surround/statusline) | <https://github.com/nvim-mini/mini.nvim> |
| `nvim-treesitter/nvim-treesitter` | Treesitter parser and highlighting | <https://github.com/nvim-treesitter/nvim-treesitter/wiki> |

## Mason-managed external tools

Source: `scripts/modules/41-config-nvim-bootstrap.sh`

| Tool | Role | Reference |
|---|---|---|
| `stylua` | Lua formatter | <https://github.com/JohnnyMorganz/StyLua> |
| `pyright` | Python language server/type checker | <https://github.com/microsoft/pyright> |
| `clangd` | C/C++ language server | <https://clangd.llvm.org/> |
| `rust-analyzer` | Rust language server | <https://rust-analyzer.github.io/> |

## VS Code extensions installed by script

Source: `scripts/modules/33-tools-vscode.sh`

Use marketplace URL format: `https://marketplace.visualstudio.com/items?itemName=<extension-id>`

| Extension ID | Reference |
|---|---|
| `ms-python.python` | <https://marketplace.visualstudio.com/items?itemName=ms-python.python> |
| `ms-python.vscode-pylance` | <https://marketplace.visualstudio.com/items?itemName=ms-python.vscode-pylance> |
| `charliermarsh.ruff` | <https://marketplace.visualstudio.com/items?itemName=charliermarsh.ruff> |
| `rust-lang.rust-analyzer` | <https://marketplace.visualstudio.com/items?itemName=rust-lang.rust-analyzer> |
| `ms-vscode.cpptools` | <https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools> |
| `llvm-vs-code-extensions.vscode-clangd` | <https://marketplace.visualstudio.com/items?itemName=llvm-vs-code-extensions.vscode-clangd> |
| `ms-toolsai.jupyter` | <https://marketplace.visualstudio.com/items?itemName=ms-toolsai.jupyter> |
| `vscodevim.vim` | <https://marketplace.visualstudio.com/items?itemName=vscodevim.vim> |
| `GitHub.copilot-chat` | <https://marketplace.visualstudio.com/items?itemName=GitHub.copilot-chat> |
| `GitHub.vscode-pull-request-github` | <https://marketplace.visualstudio.com/items?itemName=GitHub.vscode-pull-request-github> |
| `pkief.material-icon-theme` | <https://marketplace.visualstudio.com/items?itemName=pkief.material-icon-theme> |
| `njpwerner.autodocstring` | <https://marketplace.visualstudio.com/items?itemName=njpwerner.autodocstring> |
| `aaron-bond.better-comments` | <https://marketplace.visualstudio.com/items?itemName=aaron-bond.better-comments> |
