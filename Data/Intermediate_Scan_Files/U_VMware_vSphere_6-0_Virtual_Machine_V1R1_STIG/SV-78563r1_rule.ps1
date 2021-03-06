$VID = "V-64073"

$Value = ( $VM | Get-AdvancedSetting -Name isolation.tools.ghi.trayicon.disable ).Value

Switch ( $Value -eq $True ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "isolation.tools.ghi.trayicon.disable: '$Value'. Must be '$True'"
    }
}
