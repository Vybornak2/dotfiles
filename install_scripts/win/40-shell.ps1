winget install Microsoft.PowerShell --accept-package-agreements --accept-source-agreements
winget install JanDeDobbeleer.OhMyPosh --accept-package-agreements --accept-source-agreements
winget install DEVCOM.JetBrainsMonoNerdFont --accept-package-agreements --accept-source-agreements

Install-Module PSReadLine -Scope CurrentUser -Force -SkipPublisherCheck
Install-Module PSFzf -Scope CurrentUser -Force
Install-Module posh-git -Scope CurrentUser -Force
