<#
    .SYNOPSIS
    Returns the SQL Server version table

    .DESCRIPTION
    View release names, engine version and compatablity levels for all major SQL Server releases
    since SQL Server 2000

    .EXAMPLE
    # Returns the verison table
    PS> Get-dwSqlServerVersionTable
#>
function Get-SqlServerVersionTable {
    [CmdletBinding()]
    param (
    )

    Set-StrictMode -Version 'Latest'

    $versions = @(
        [PSCustomObject]@{Name = 'SQL Server 2019';   EngineVersion = 15.0 ; CompatablityLevel = 150 }
        [PSCustomObject]@{Name = 'SQL Server 2017';   EngineVersion = 14.0 ; CompatablityLevel = 140 }
        [PSCustomObject]@{Name = 'SQL Server 2016';   EngineVersion = 13.0 ; CompatablityLevel = 130 }
        [PSCustomObject]@{Name = 'SQL Server 2014';   EngineVersion = 12.0 ; CompatablityLevel = 120 }
        [PSCustomObject]@{Name = 'SQL Server 2012';   EngineVersion = 11.0 ; CompatablityLevel = 110 }
        [PSCustomObject]@{Name = 'SQL Server 2008R2'; EngineVersion = 10.5 ; CompatablityLevel = 100 }
        [PSCustomObject]@{Name = 'SQL Server 2008';   EngineVersion = 10.0 ; CompatablityLevel = 100 }
        [PSCustomObject]@{Name = 'SQL Server 2005';   EngineVersion =  9.0 ; CompatablityLevel =  90 }
        [PSCustomObject]@{Name = 'SQL Server 2000';   EngineVersion =  8.0 ; CompatablityLevel =  80 }
    )

    return $versions
}
