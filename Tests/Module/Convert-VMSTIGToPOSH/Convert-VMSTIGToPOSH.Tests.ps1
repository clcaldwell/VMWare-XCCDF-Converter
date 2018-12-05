$ThisModule = $MyInvocation.MyCommand.Path -replace '\\Tests'
$ThisModule = $ThisModule -Replace '\.Tests\.ps1$'
Write-Host "ThisModule: $ThisModule"
$ThisModuleName = $ThisModule | Split-Path -Leaf
Write-Host "ThisModuleName: $ThisModuleName"
Get-Module -Name $ThisModuleName -All | Remove-Module -Force -ErrorAction Ignore
Import-Module -Name "$ThisModule.psm1" -Force -ErrorAction Stop

Describe "Blank tests" {
    It "doesn't test anything yet" {

    }
}
