# ISE Profile
. "H:\PowerShell\Show-SerpenzSplash.ps1"

# add custom command to add-ons menu
#$parent = $psise.CurrentPowerShellTab.AddOnsMenu.SubMenus.Add('My Tools', $null, $null)
#$psise.CurrentPowerShellTab.AddOnsMenu.Submenus.Add('Get Script Path', { $psise.CurrentFile.FullPath }, $null)
#$psise.CurrentPowerShellTab.AddOnsMenu.Submenus.Add('Go to Serpenz', { Start-Process www.serpenz.co.nz }, $null)

function Add-AddOnsMenuItem {
    param (
        [string]$MenuItem,
        [scriptblock]$Action
    )

    $psise.CurrentPowerShellTab.AddOnsMenu.SubMenus.Add($MenuItem, $Action, $null)
}

Add-AddOnsMenuItem -MenuItem 'Get Script Path' -Action { $psise.CurrentFile.FullPath }
Add-AddOnsMenuItem -MenuItem 'Go to Serpenz' -Action { Start-Process www.serpenz.co.nz }

Show-SerpenzSplash -sleepTime 1

$executionPolicy = Get-ExecutionPolicy

function prompt {
    Write-Host
    Write-Host -NoNewLine "["
    Write-Host -NoNewLine (Get-Date -Format "dd/MM/yyyy | HH:mm") -ForegroundColor White
    Write-Host -NoNewLine "] ["
    Write-Host -NoNewLine $env:UserName.ToLower() -ForegroundColor Blue
    Write-Host -NoNewLine "@" -ForegroundColor Blue
    Write-Host -NoNewLine $env:UserDomain.ToLower() -ForegroundColor Blue
    Write-Host -NoNewLine "] on ["
    Write-Host -NoNewLine $env:ComputerName -ForegroundColor Yellow
    Write-Host -NoNewLine "] ("
    Write-Host -NoNewLine $env:OS
    Write-Host -NoNewLine ") {"
    Write-Host -NoNewLine $executionPolicy -ForegroundColor Magenta
    Write-Host -NoNewLine "}"
    Write-Host -NoNewLine "`n["
    Write-Host -NoNewLine (Get-Location).Path -ForegroundColor Red
    Write-Host -NoNewLine "]"
    return "`nPS > "
}

# to simplify Access
$MyPowerShell = "$(split-path $profile)"
$MyScripts = "$(split-path $profile)\Scripts"
$MyScriptsDev = "$(split-path $profile)\ScriptsDev"
$MyModules = "$(split-path $profile)\Modules"
$MyDocs    =  [environment]::GetFolderPath('MyDocuments')
$MyDesktop =  [environment]::GetFolderPath('Desktop')
$MyProjects = "$MyDocs\Projects"
$MyTemp = "C:\Temp"
