New-UDPage -Url "/Modules" -Name "Modules" -Content {
if (-not $Cache:Modules) {
    $Cache:Modules = Get-Module -ListAvailable
}

New-UDTable -Data ($Cache:Modules | Sort-Object Name) -Columns @(
    New-UDTableColumn -Property 'Name' -Render {
        New-UDStack -Spacing 1 -Direction row -Content {
            if ($EventData.IconUri) {
                New-UDImage -Url $EventData.IconUri -Height 32 -Width 32
            }
            New-UDTypography -Text $EventData.Name
        }
    }
    New-UDTableColumn -Property 'Version'
) -ShowPagination -ShowSearch
}