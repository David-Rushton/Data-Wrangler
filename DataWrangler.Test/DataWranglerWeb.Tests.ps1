$ModuleName = 'DataWrangler'
$ModulePath = "$PSScriptRoot\..\DataWrangler\$ModuleName"
$ModuleManifestPath = "$PSScriptRoot\..\DataWrangler\$ModuleName.psd1"

Describe 'Data Wrangler Web Tests' {
    Import-Module -Name $ModulePath -Force

    InModuleScope $ModuleName {
        It 'Passes Web Root Found' {

            Test-Path -Path 'DataWranglerWeb:' | Should Be $true
        }
    }
}
