New-UDPage -Url "/Host-Processes" -Name "Host Processes" -Content {
$Processes = Get-PSHostProcessInfo 
New-UDTable -Data $Processes
}