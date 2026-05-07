oh-my-posh init pwsh --config "$HOME\dotfiles\posh\config.omp.json" | Invoke-Expression

$env:EDITOR = "nvim"
$env:VISUAL = "nvim"

function hh { Set-Location ~ }
function dt { Set-Location ~/Desktop }
function pr { Set-Location ~/Projects }
function ipy { uv tool run ipython @args }
