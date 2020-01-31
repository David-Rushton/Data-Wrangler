<#
#>
function Test-SqlPackage {
    [CmdletBinding()]
    param (

    )

    Set-StrictMode -Version 'Latest'

    [string[]]$sqlPackagePaths = @()


    # Search Visual Studio paths
    #
    # C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\IDE\Extensions\Microsoft\SQLDB\DAC\130
    # C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\IDE\Extensions\Microsoft\SQLDB\DAC\140
    # C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\IDE\Extensions\Microsoft\SQLDB\DAC\150
    #                                                ---- ---------
    # VS mod?
    # VS 2017, etc
    #


    # Search SQL Server Paths
    $compatablityLevels = (Get-dwSqlServerVersionTable | Select-Object -Property 'CompatablityLevel').CompatablityLevel
    foreach($compatablityLevel in $compatablityLevels) {
        [string]$candidatePath = "C:\Program Files\Microsoft SQL Server\$compatablityLevel\DAC\bin\SqlPackage.exe"
        if(Test-Path -Path $candidatePath) {
            $sqlPackagePaths += $candidatePath
        }
    }


    return (Get-Command $sqlPackagePaths)
}
