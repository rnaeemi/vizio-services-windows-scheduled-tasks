$ROOT_PATH = 'C:\inetpub\wwwroot'

$FILENAME_PATTERN = '^LogFile\(ProcessId-\d+\)\(\d{4}-\d{2}-\d{2}\).txt(|.1)$'
$DAYSBACK = 30

$DAYSBACK_DATE = (Get-Date).AddDays(-$DAYSBACK)

Write-Host "Deleting all LogFiles older than $DAYSBACK days..."
Get-ChildItem -File -Path $ROOT_PATH | Where-Object {
  $_.Name -match $FILENAME_PATTERN -and
  $_.LastWriteTime -lt $DAYSBACK_DATE
} | Remove-Item

