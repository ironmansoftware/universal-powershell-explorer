New-UDDashboard -Title 'PowerShell Universal' -Pages @(
    Get-UDPage -Name 'Home'
    Get-UDPage -Name 'Modules'
    Get-UDPage -Name 'Host Processes'
    Get-UDPage -Name 'Providers'
)