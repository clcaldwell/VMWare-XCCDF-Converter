# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

using module .\VMWare-Stig.psm1
using module .\Module\Convert-ESXSTIGToPOSH\Convert-ESXSTIGToPOSH.psm1
using module .\Module\Convert-VMSTIGToPOSH\Convert-VMSTIGToPOSH.psm1

# load the public StigData functions

<#
$pathList = @(
    "$PSScriptRoot\Module\Stig.Main",
    "$PSScriptRoot\Module\STIG.Checklist"
)

foreach ($supportFile in (Get-ChildItem -Path $pathList -Filter '*.ps1'))
{
    Write-Verbose "Loading $($supportFile.FullName)"
    . $supportFile.FullName
}

Export-ModuleMember -Function @(
    'Get-OrgSettingsObject',
    'Get-DomainName',
    'Get-StigList',
    'New-StigCheckList'
)
#>