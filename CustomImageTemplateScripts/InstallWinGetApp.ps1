[CmdletBinding()]
Param (
    [Parameter(Mandatory)]
    [System.String[]]$ApplicationIds
)

Write-Host '*** AVD AIB CUSTOMIZER PHASE ***  Install Winget Applications ***'
Foreach ($applicationId in $ApplicationIds) {
    Write-Host "*** AVD AIB CUSTOMIZER PHASE ***  Install Winget Applications - Installing: $($app.name) ***"

    winget install --exact --silent --scope machine --accept-package-agreements --accept-source-agreements --id $applicationId
    if ($LASTEXITCODE -eq 0) {
        Write-Host "*** AVD AIB CUSTOMIZER PHASE ***  Install Winget Applications - Installed: $($app.name) ***"
    }
    else {
        Write-Host "*** AVD AIB CUSTOMIZER PHASE ***  Install Winget Applications - Could not install: $($app.name) ***"
        throw
    }
}