$ModuleName = 'DataWrangler'
$ModulePath = "$PSScriptRoot\..\DataWrangler\$ModuleName"
$ModuleManifestPath = "$PSScriptRoot\..\DataWrangler\$ModuleName.psd1"

Describe 'Module Manifest Tests' {
    It 'Passes Test-ModuleManifest' {
        Test-ModuleManifest -Path $ModuleManifestPath | Should Not BeNullOrEmpty
        $? | Should Be $true
    }

    It 'Passes Import-Module' {
        Import-Module -Name $ModulePath -Force
        $? | Should Be $true
    }
}
