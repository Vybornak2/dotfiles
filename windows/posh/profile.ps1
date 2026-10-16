################################## Oh My Posh ##################################
oh-my-posh init powershell --config "$HOME\dotfiles\windows\posh\config.omp.json" | Invoke-Expression

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
$psFzfBindings = @{
    'Ctrl+t' = 'Invoke-FzfPsReadlineHandlerProvider'
    'Ctrl+r' = 'Invoke-FzfPsReadlineHandlerHistory'
    'Alt+c' = 'Invoke-FzfPsReadlineHandlerSetLocation'
    'Alt+a' = 'Invoke-FzfPsReadlineHandlerHistoryArgs'
}
foreach ($chord in $psFzfBindings.Keys) {
    # PSFzf only claims its optional Alt bindings when they are unbound.
    if ($chord -like 'Alt+*' -and (Get-PSReadLineKeyHandler -Chord $chord)) {
        continue
    }
    $handler = $psFzfBindings[$chord]
    Set-PSReadLineKeyHandler -Chord $chord -BriefDescription $handler -ScriptBlock {
        Import-Module PSFzf -Global -ErrorAction Stop
        Set-PSFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
        & "PSFzf\$handler"
    }.GetNewClosure()
}
$env:FZF_DEFAULT_COMMAND = 'fd --type f --hidden --follow --exclude .git'

########################## Suggestions & Completions ###########################
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle InlineView
Set-PSReadLineKeyHandler -Chord 'Alt+y' -Function AcceptSuggestion
Set-PSReadLineKeyHandler -Chord 'Ctrl+Spacebar' -Function MenuComplete

# Load posh-git on the first completion, then use its own completer.
if ($PSVersionTable.PSVersion.Major -ge 6 -and -not (Get-Module posh-git)) {
    $gitCommands = @('git', 'tgit', 'gitk')
    $gitCommands += Get-Alias | Where-Object { $_.Definition -match '^(git|tgit|gitk)(\.exe)?$' } | ForEach-Object Name
    Register-ArgumentCompleter -CommandName $gitCommands -Native -ScriptBlock {
        param($wordToComplete, $commandAst, $cursorPosition)

        Import-Module posh-git -Global -ErrorAction Stop
        $position = $cursorPosition - $commandAst.Extent.StartOffset
        $text = $commandAst.ToString().PadRight($position, ' ')
        [System.Management.Automation.CommandCompletion]::CompleteInput($text, $position, $null).CompletionMatches
    }
}
else {
    Import-Module posh-git
}

################################### Aliases ####################################

function hh { Set-Location ~ }
function dt { Set-Location ~/Desktop }
function prc { Set-Location ~/Projects }
function ipy { uv tool run ipython @args }

Set-PSReadLineKeyHandler -Chord 'Ctrl+Enter' -Function AddLine
