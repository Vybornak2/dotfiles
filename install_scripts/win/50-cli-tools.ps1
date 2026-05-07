winget install BurntSushi.ripgrep.MSVC --accept-package-agreements --accept-source-agreements
winget install sharkdp.fd --accept-package-agreements --accept-source-agreements
winget install ajeetdsouza.zoxide --accept-package-agreements --accept-source-agreements
winget install junegunn.fzf --accept-package-agreements --accept-source-agreements

$env:PATH += ";$env:USERPROFILE\.cargo\bin"
cargo install tree-sitter-cli
