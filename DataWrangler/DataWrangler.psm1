#
# Data Wrangle
#

Set-StrictMode -Version 'Latest'


# Used to import module files
$private   = @(Get-ChildItem -Path ([System.IO.Path]::Combine($PSScriptRoot, 'Private')))
$public    = @(Get-ChildItem -Path ([System.IO.Path]::Combine($PSScriptRoot, 'Public')))

foreach($import in @($private, $public)) {
    . $import.FullName
}


# Web root
if ( ! (Test-Path -Path 'DataWranglerWeb:') ) {
    New-PSDrive -Name 'DataWranglerWeb' -PSProvider 'FileSystem' -Root "$PSScriptRoot\Resources\DataWranglerWeb"
}


# Export only the functions using PowerShell standard verb-noun naming.
# Be sure to list each exported functions in the FunctionsToExport field of the module manifest file.
# This improves performance of command discovery in PowerShell.
Export-ModuleMember -Function *-*
