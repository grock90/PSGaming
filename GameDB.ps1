Param
(
    [Parameter(Mandatory)]
    $DatabaseName,

    [ValidateScript({Test-Path $_})]
    [Parameter(Mandatory)]
    $DBPath
)

Install-Module -Name PSSQLite

$Database = ('{0}\{1}.SQLite' -f $DBPath,$DatabaseName)

if(!(Test-Path -Path $Database))
{
    $Query = "CREATE TABLE NAMES (
        UserName VARCHAR(20) PRIMARY KEY,
        Age INT,
        Location TEXT,
        Rank INT)"
    Invoke-SqliteQuery -Query $Query -DataSource $Database

    Invoke-SqliteQuery -DataSource $Database -Query "PRAGMA table_info(NAMES)"
}


