New-UDPage -Url "/Providers" -Name "Providers" -Content {
$Providers = Get-PSProvider | Sort-Object Name | ForEach-Object {
    New-UDTreeNode -Name $_.Name -Id "Provider:$($_.Name)"
}

New-UDElement -Tag div -Content {
    New-UDTreeView -Node { $Providers } -OnNodeClicked {

        if ($EventData.Id.StartsWith("Provider")) {
            Get-PSDrive -PSProvider $EventData.Id.Split(":")[1] | ForEach-Object {
                New-UDTreeNode -Name $_.Name -Id "$($_.Name):\"
            }
        }
        else {
            Get-ChildItem $EventData.Id | ForEach-Object {
                $leaf = -not $_.PSIsContainer
                New-UDTreeNode -Name $_ -Id $_.PSPath -Leaf:$leaf
            }
        }
    }
}
}