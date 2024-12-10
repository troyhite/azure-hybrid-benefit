$azSubs = Get-AzSubscription

foreach ( $azSub in $azSubs ){
    Set-AzContext -Subscription $azSub | Out-Null
    $azSubName = $azSub.Name
    $AzureVM = @()

    foreach ($azVM in Get-AzVM) {
        $props = @{
            VMName = $azVM.Name
            Region = $azVM.Location
            OsType = $azVM.StorageProfile.OsDisk.OsType
            ResourceGroupName = $azVM.ResourceGroupName
        }
        if (!$azVM.LicenseType) {
            $props += @{
                LicenseType = "No_License"
            }
        }
        else {
            $props += @{
                LicenseType = $azVM.LicenseType
            }
        }
    $ServiceObject = New-Object -TypeName PSObject -Property $props
    $AzureVM += $ServiceObject
    }
$AzureVM | Export-Csv "$azSubName-AzVM-Licensing.csv" -NoTypeInformation -force
}