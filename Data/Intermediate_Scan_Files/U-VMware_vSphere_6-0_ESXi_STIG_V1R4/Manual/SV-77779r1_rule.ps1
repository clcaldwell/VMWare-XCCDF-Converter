$VID = "V-63289"

$Value = ( $VMHost | CHANGEME )

Switch ( $Value -eq "CHANGEME" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "CHANGEME: '$Value'. Must be 'CHANGEME'"
    }
}

From the vSphere Client go to Configuration >> Networking >> vSphere Standard Switch.  View the properties on each virtual switch and port group and verify "MAC Address Changes" is set to reject.

or

From a PowerCLI command prompt while connected to the ESXi host run the following commands:

Get-VirtualSwitch | Get-SecurityPolicy
Get-VirtualPortGroup | Get-SecurityPolicy

If the "MAC Address Changes" policy is set to accept, this is a finding.

