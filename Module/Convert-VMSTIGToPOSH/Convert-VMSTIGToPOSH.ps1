using module ./Convert-VMSTIGToPOSH.psm1

$VMPowershellScanFilesParam = @{
    XCCDF = "C:\Users\601681\Projects\VMWare-Stig\Data\Source_Files\U_VMware_vSphere_6-0_Virtual_Machine_STIG_V1R1_Manual-xccdf.xml"
    OutPath = "C:\Users\601681\Projects\tests\U_VMware_vSphere_6-0_Virtual_Machine_V1R1_STIG\VM_Checks\"
}

New-VMPowershellScanFiles @VMPowershellScanFilesParam