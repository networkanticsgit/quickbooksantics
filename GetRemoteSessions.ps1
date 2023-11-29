$quserResult = New-Object -TypeName 'System.Collections.ArrayList';
$queryAllConnections=(((quser) -replace '^>', '') -replace '\s{2,}', ',').Trim() | ForEach-Object {
    if($_.Split(',').Count -eq 5) {
        Write-Output ($_-replace '(^[^,]+)', '$1,')
    } else{
        Write-Output $_}
} | ConvertFrom-Csv

foreach($userSession in $queryAllConnections)
{
    if($userSession.SESSIONNAME -like "rdp*"){
         $quserResult.Add($userSession) >$null
    }
        
    
}
