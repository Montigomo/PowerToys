
# Agitech 2015.08.11

function PromptBad
{
    #(Get-Host).UI.RawUI.WindowTitle="PS $(Get-Location)"
    #"PS > "
    (Get-Host).UI.RawUI.WindowTitle="PS $(Get-Location)"
    Write-Host ("PS " + $(get-location) +">") -nonewline -foregroundcolor Magenta
    return " "
}

$impModules = @("agt*", "Pscx", "Posh-SSH")

$impModules | ForEach-Object { Get-Module -ListAvailable  -Name $_ | ForEach-Object { if(-not(Get-Module -Name $_.Name)) { Import-Module $_.Name} } }


$FileAzureShortcutStartup = "C:\Program Files (x86)\Microsoft SDKs\Azure\PowerShell\ServiceManagement\Azure\Services\ShortcutStartup.ps1"
If (Test-Path $FileAzureShortcutStartup){
	Write-host "Loading Azure functionality... " -NoNewline
	Import-Module "$FileAzureShortcutStartup" | Out-Null
	Write-Host "Done!" -ForegroundColor Green
}

#Add variable for onedrive from registry
Write-host "Get OneDriver path... " -NoNewline
$onedrive = (Get-ItemProperty -Path "hkcu:\Software\Microsoft\Windows\CurrentVersion\SkyDrive\" -Name UserFolder).UserFolder
Write-Host "Done!" -ForegroundColor Green

#Add onedrive modules to the PSModule path.
Write-host "Add Modules from onedrive... " -NoNewline
$env:PSModulePath = $env:PSModulePath + ";$onedrive\Software\PowerShell\Modules"
Write-Host "Done!" -ForegroundColor Green
