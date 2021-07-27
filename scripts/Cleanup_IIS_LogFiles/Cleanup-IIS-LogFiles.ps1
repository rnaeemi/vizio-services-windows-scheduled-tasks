$ROOT_PATH = 'C:\inetpub\logs\LogFiles\W3SVC1'

$FILENAME_PATTERN = '^u_ex\d{6}.log$'
$DAYSBACK = 14

$DAYSBACK_DATE = (Get-Date).AddDays(-$DAYSBACK)

Write-Host "Deleting all LogFiles older than $DAYSBACK days..."
Get-ChildItem -File -Path $ROOT_PATH | Where-Object {
  $_.Name -match $FILENAME_PATTERN -and
  $_.LastWriteTime -lt $DAYSBACK_DATE
} |  Remove-Item
