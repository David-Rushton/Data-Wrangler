#
# Data Wrangle
#

Set-StrictMode -Version 'Latest'

#$MyInvocation.
# Used to import module files
$private    = Join-Path -Path $PSScriptRoot -ChildPath 'Private'
$public     = Join-Path -Path $PSScriptRoot -ChildPath 'Public'

foreach($location in @($private, $public)) {
    foreach($import in (Get-ChildItem -Path $location)) {
        . $import.FullName
    }
}


# Web root
if ( ! (Test-Path -Path 'DataWranglerWeb:') ) {
    New-PSDrive -Name 'DataWranglerWeb' -PSProvider 'FileSystem' -Root "$PSScriptRoot\Resources\DataWranglerWeb"
}


# Export only the functions using PowerShell standard verb-noun naming.
# Be sure to list each exported functions in the FunctionsToExport field of the module manifest file.
# This improves performance of command discovery in PowerShell.
Export-ModuleMember -Function *-*
