function Test-DacPac {

## PUBLISH [+ PROFILE] TO COPY DB FROM PROD TO LOCAL?
## https://docs.microsoft.com/en-us/sql/tools/sqlpackage?view=sql-server-ver15#help-for-the-extract-action









# Require DacPac file
# Require PreDeploySupport
# Require TargetServer
# Require TargetDatabase
# Requore SqlPackage

Add-Type -assembly 'System.IO.Compression.FileSystem'

[string]$DacPacPath = 'C:\Users\David\OneDrive\Desktop\dr.SqlDatabase.dacpac'
[string]$PreDeployScriptPath = 'C:\Users\David\OneDrive\Desktop\dr.SqlDatabase.pre.sql'
[string]$TargetServer = '.,15010'
[string]$TargetDatabase = 'SSDT_TEST'

if( ! (Test-Path -Path @($DacPacPath, $PreDeployScriptPath)) ) {
    throw "File not found: $DacPacPath"
}


$sqlPackagePath = 'C:\Program Files\Microsoft SQL Server\150\DAC\bin\SqlPackage.exe'
$targetDacPacPath =  'C:\Users\David\OneDrive\Desktop\dr.SqlDatabase.prod.dacpac'

& $sqlPackagePath /Action:Extract /SourceServerName:$TargetServer /SourceDatabaseName:$TargetDatabase /SourceUser:SA /SourcePassword:'Abc!12345' /TargetFile:E:\Repos\Data-Wrangler\prod.dacpac
# & $sqlPackagePath /Action:Publish /TargetServerName:$TargetServer /TargetDatabaseName:$TargetDatabase /TargetUser:SA /TargetPassword:'Abc!12345'




<#

Add-Type -assembly "system.io.compression.filesystem"
$zip = [io.compression.zipfile]::OpenRead("e:\E.zip")
$file = $zip.Entries | where-object { $_.Name -eq "XMLSchema1.xsd"}
$stream = $file.Open()

$reader = New-Object IO.StreamReader($stream)
$text = $reader.ReadToEnd()
$text

$reader.Close()
$stream.Close()
$zip.Dispose()

#>
}
