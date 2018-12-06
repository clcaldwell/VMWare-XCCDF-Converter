$ThisModule = $MyInvocation.MyCommand.Path -replace '\\Tests'
$ThisModule = $ThisModule -Replace '\.Tests\.ps1$'
Write-Output "ThisModule: $ThisModule"
$ThisModuleName = $ThisModule | Split-Path -Leaf
Write-Output "ThisModuleName: $ThisModuleName"
Get-Module -Name $ThisModuleName -All | Remove-Module -Force -ErrorAction Ignore
Import-Module -Name "$ThisModule.psm1" -Force -ErrorAction Stop

InModuleScope $ThisModuleName {

    Context -Name "Get-Setting" {
        Describe "Get-Setting Test on simple input" {
            It "Makes sure correct Setting is returned on simple inputs" {
                Get-Setting -InputLine "blah blah verify it is set to 18 " | Should Be "18"
                Get-Setting -InputLine "blahblahblah verify it is set to root" | Should Be "root"
                Get-Setting -InputLine "blahblahblah verify it is set to root" | Should Be "root"
                Get-Setting -InputLine "verify it is set to 18 " | Should Be "18"
                Get-Setting -InputLine "hkjahsdlf hakjsdhflk aksdjhfl ka laks" | Should be $null
            }
        }

        Describe "Get-Setting Test on dotted inputs" {
            It "Makes sure correct Setting Value is returned on dotted inputs" {
                Get-Setting -InputLine "blahblah If the marco.polo.marco.polo setting is not set to FindMarcoPolo " | Should Be "FindMarcoPolo"
                #Get-Setting -InputLine "blah If the `"marco.polo.marco.polo`" keyword is set to `"Find MarcoPolo`" " | Should Be "Find MarcoPolo"
            }
        }

        Describe "Get-Setting Test on slashed inputs" {
            It "Makes sure correct Setting Value is returned on slashed inputs" {
                Get-Setting -InputLine "blah * blah: HKLM\Path\PathyPath\SuperPathyPath blah\blah\blah/blah" | Should Be $null
                Get-Setting -InputLine "blah blah: blah_blah" | Should Be $null
                Get-Setting -InputLine "blah * blah: marco.polo.polopo blah/blah/blah" | Should Be $null
            }
        }

    }
}
