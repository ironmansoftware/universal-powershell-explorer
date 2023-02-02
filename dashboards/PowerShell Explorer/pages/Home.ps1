New-UDPage -Url "/Home" -Name "Home" -Content {
$Data = $PSVersionTable.GetEnumerator() | ForEach-Object {
    [PSCustomObject]@{ 
        Name = $_.Key
        Value = $_.Value
    }
}

New-UDTable -Title 'PowerShell Version Information' -Data $Data -Columns @(
    New-UDTableColumn -Property 'Name'
    New-UDTableColumn -Property 'Value'
)
}