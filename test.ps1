$t = 'pat0KeG33iHuNNwPm.a4413a9d2618ad3a6656ccbfb52e2d7f28e76b464451e792e5620ab879d8e7c3'

# Active and upcoming install WOs
$filter = [System.Uri]::EscapeDataString('AND(OR({Work Order Status}="Not Started",{Work Order Status}="In Progress",{Work Order Status}="Verification Required"),FIND("Install",ARRAYJOIN({Category},",")))')
$u = "https://api.airtable.com/v0/appqIXms8VnRTFv3b/tblHuJKm0Sd3MDtzc?fields[]=Name&fields[]=Work Order Status&fields[]=% Complete&fields[]=Scheduled Completion Date&fields[]=Due Date&fields[]=Category&fields[]=Field Supervisor (FWO)&filterByFormula=$filter&sort[0][field]=Scheduled Completion Date&sort[0][direction]=asc"
$r = Invoke-RestMethod -Uri $u -Headers @{ Authorization = "Bearer $t" }
Write-Host "Install WOs: $($r.records.Count)"
foreach ($rec in $r.records) {
    $rec.fields | ConvertTo-Json -Compress
    Write-Host '---'
}
