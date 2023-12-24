# Enable TLSv1.2 for compatibility with older clients
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor [System.Net.SecurityProtocolType]::Tls12

$connectionProfiles = Get-NetConnectionProfile | Where-Object "InterfaceAlias" -like "Zero*"

foreach ($profile in $connectionProfiles) {
    if ($profile.NetworkCategory -eq "Public") {
        $profile | Set-NetConnectionProfile -NetworkCategory Private
	Get-NetConnectionProfile | Where-Object "InterfaceAlias" -like "Zero*"
        Write-Host "Changed network category for $($profile.Name) to Private."
    }
    elseif ($profile.NetworkCategory -eq "Private") {
	Get-NetConnectionProfile | Where-Object "InterfaceAlias" -like "Zero*"
        Write-Host "Network category for $($profile.Name) is already Private."
    }
    else {
        Write-Host "Unhandled network category for $($profile.Name): $($profile.NetworkCategory)"
    }
}
