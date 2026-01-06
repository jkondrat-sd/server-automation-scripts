. "$PSScriptRoot\Deploy-DotNetWebsite.ps1"

$repoTokenFile = "C:\config\tokens\github-statics.txt"

if (-not (Test-Path $repoTokenFile)) {
  Write-Error "Repo token file not found at '$repoTokenFile'"
  return
}

$repoToken = Get-Content -Path $repoTokenFile -Raw

Deploy-DotNetWebsite `
  -RepoUrl "https://github.com/florin-rotaru-md/Statics.git" `
  -RepoBranch "ui-dev-waa" `
  -RepoToken $repoToken `
  -ProjectPath "Apps/Waa/Waa.Client.Server/Waa.Client.Server.csproj" `
  -HostName "ui.dev.waa.ro" `
  -GreenHttpPort 8001 `
  -BlueHttpPort 8002 `
  -CCSConfigFile "C:\config\ccs.json" `
  -WacsValidationMethod "cloudflare-dns" `
  -WacsArgsCloudflareTokenPath "C:\config\tokens\clooudflare-zone-dns-waa.ro.txt" `
  -WacsArgsEmailAddress "rotaru.i.florin@outlook.com" `

