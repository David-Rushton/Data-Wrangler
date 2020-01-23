<#
    .SYNOPSIS
    Locates installed SQL tools.

    .DESCRIPTION
    Searches the path and local computer for SQL Tools including:

    - bcp
    - SqlCmd
    - SqlPackage
#>
Function Get-SqlTools {
    [CmdletBinding()]
    param(

    )

    # C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\MSBuild\Current\Bin
    # C:\Program Files\Microsoft SQL Server\150\DAC\bin
    # C:\Program Files (x86)\Microsoft SQL Server Management Studio 18\Common7\IDE\ssms.exe
    # C:\Users\David\AppData\Local\Programs\Azure Data Studio\azuredatastudio.exe

    $sqlTools = @(
        [PSCustomObject]@{Name = 'bcp';         Path = ''; IsAvailable = $false; IsOnPath = $false;}
        [PSCustomObject]@{Name = 'SqlCmd';      Path = ''; IsAvailable = $false; IsOnPath = $false;}
        [PSCustomObject]@{Name = 'SqlPackage';  Path = ''; IsAvailable = $false; IsOnPath = $false;}
        [PSCustomObject]@{Name = 'MsBuild';     Path = ''; IsAvailable = $false; IsOnPath = $false;}
    )

    foreach($sqlTool in $sqlTools) {
        # TODO: What is fallback for not on path?
        $command = Get-Command -Name $sqlTool.Name -ErrorAction 'SilentlyContinue'
        if($command) {
            $sqlTool.Path = $command.Path
            $sqlTool.IsOnPath = $true
            $sqlTool.IsAvailable = $true
        }
    }


    Write-Output $sqlTools
}
