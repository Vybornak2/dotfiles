################################## Oh My Posh ##################################
$omp_cache = "$env:TEMP\omp_profile.ps1"
if (-not (Test-Path $omp_cache)) {
    oh-my-posh init powershell --config "$HOME\dotfiles\posh\config.omp.json" --print > $omp_cache
}
. $omp_cache

#################################### Zoxide ####################################
$zoxide_cache = "$env:TEMP\zoxide_profile.ps1"
if (-not (Test-Path $zoxide_cache)) {
    zoxide init powershell > $zoxide_cache
}
. $zoxide_cache

################################### Defaults ###################################
$env:EDITOR = "nvim"
$env:VISUAL = "nvim"

##################################### FZF ######################################
Import-Module PSFzf
Set-PSFzfOption -PSReadlineChordProvider 'Ctrl+t'
Set-PSFzfOption -PSReadlineChordReverseHistory 'Ctrl+r'
$env:FZF_DEFAULT_COMMAND = 'fd --type f --hidden --follow --exclude .git'

########################## Suggestions & Completions ###########################
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle InlineView
Set-PSReadLineKeyHandler -Chord 'Alt+y' -Function AcceptSuggestion
Set-PSReadLineKeyHandler -Chord 'Ctrl+Spacebar' -Function MenuComplete

# 1. Load Git Completions
Import-Module posh-git

################################### Aliases ####################################

function hh { Set-Location ~ }
function dt { Set-Location ~/Desktop }
function pr { Set-Location ~/Projects }
function ipy { uv tool run ipython @args }
function nv { nvim @args }
