# Tooling Reference

This document tracks the tools, package managers, and extension/plugin dependencies used by this dotfiles setup.

## Installer entrypoints

- Main installer: `scripts/install.sh`
- Shared helpers: `scripts/lib/common.sh`
- Modules: `scripts/modules/*.sh`

## Package and environment managers

- APT (Ubuntu/Pop!_OS): <https://wiki.debian.org/Apt>
- Oh My Zsh framework: <https://ohmyz.sh/>
- Rustup (Rust toolchain manager): <https://rustup.rs/>
- uv (Python package/tool manager): <https://docs.astral.sh/uv/>
- nvm (Node.js version manager): <https://github.com/nvm-sh/nvm>
- Mason (Neovim external tools manager): <https://github.com/mason-org/mason.nvim>
- lazy.nvim (Neovim plugin manager): <https://github.com/folke/lazy.nvim>

## Core CLI tools installed by installer

Source: `scripts/modules/20-deps-core-packages.sh`, `scripts/modules/26-deps-node.sh`, `scripts/modules/32-tools-extra-cli.sh`

- Git: <https://git-scm.com/doc>
- ripgrep (`rg`): <https://github.com/BurntSushi/ripgrep>
- fd (`fd-find` package on Debian/Ubuntu): <https://github.com/sharkdp/fd>
- fzf: <https://github.com/junegunn/fzf>
- jq: <https://jqlang.github.io/jq/>
- kitty: <https://sw.kovidgoyal.net/kitty/>
- tree: <http://mama.indstate.edu/users/ice/tree/>
- bat: <https://github.com/sharkdp/bat>
- shellcheck: <https://www.shellcheck.net/>
- Node.js (installed via nvm): <https://nodejs.org/en/docs>
- npm (bundled with nvm-managed Node.js): <https://docs.npmjs.com/>
- wl-clipboard: <https://github.com/bugaevc/wl-clipboard>
- xclip: <https://github.com/astrand/xclip>

## Python tools installed via uv

Source: `scripts/modules/32-tools-extra-cli.sh`

- ruff: <https://docs.astral.sh/ruff/>
- black: <https://black.readthedocs.io/>
- isort: <https://pycqa.github.io/isort/>
- mypy: <https://mypy.readthedocs.io/>
- pyright: <https://github.com/microsoft/pyright>
- flake8: <https://flake8.pycqa.org/>
- pytest: <https://docs.pytest.org/>
- ipython: <https://ipython.readthedocs.io/>

## Language toolchains and build dependencies

Source: `scripts/modules/21-deps-language-toolchains.sh`, `scripts/modules/31-tools-nvim.sh`

- Neovim source repository: <https://github.com/neovim/neovim>
- Neovim build docs: <https://github.com/neovim/neovim/blob/master/BUILD.md>
- GCC: <https://gcc.gnu.org/onlinedocs/>
- Clang/LLVM: <https://clang.llvm.org/docs/>
- CMake: <https://cmake.org/documentation/>
- Ninja: <https://ninja-build.org/manual.html>
- pkg-config: <https://www.freedesktop.org/wiki/Software/pkg-config/>
- Python venv: <https://docs.python.org/3/library/venv.html>
- pynvim: <https://github.com/neovim/pynvim>

## Shell stack

Source: `.zshrc`, `scripts/modules/30-tools-zsh.sh`

- Zsh docs: <https://zsh.sourceforge.io/Doc/>
- Oh My Zsh docs/wiki: <https://github.com/ohmyzsh/ohmyzsh/wiki>
- Powerlevel10k docs: <https://github.com/romkatv/powerlevel10k>
- zsh-autosuggestions: <https://github.com/zsh-users/zsh-autosuggestions>
- zsh-syntax-highlighting: <https://github.com/zsh-users/zsh-syntax-highlighting>
- zoxide: <https://github.com/ajeetdsouza/zoxide>

## Editor and IDE

### Neovim

- Neovim docs: <https://neovim.io/doc/>
- Neovim Lua guide: <https://neovim.io/doc/user/lua-guide.html>
- Kickstart.nvim reference: <https://github.com/nvim-lua/kickstart.nvim>

### Visual Studio Code

Source: `scripts/modules/33-tools-vscode.sh`

- VS Code docs: <https://code.visualstudio.com/docs>
- Extension API/docs: <https://code.visualstudio.com/api>

## Fonts

Source: `scripts/modules/22-deps-fonts.sh`

- JetBrains Mono: <https://www.jetbrains.com/lp/mono/>
- Nerd Fonts: <https://www.nerdfonts.com/>
- JetBrainsMono Nerd Font release artifact: <https://github.com/ryanoasis/nerd-fonts/releases>

## Related repository docs

- Plugin-specific references: `docs/PLUGIN_WIKI.md`
