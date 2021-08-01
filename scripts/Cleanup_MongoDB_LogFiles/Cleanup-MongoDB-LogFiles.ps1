$ROOT_PATH = 'D:\mongodb\data\log'

$FILENAME_PATTERN = '^mongod.log.\d{4}-\d{2}-\d{2}T\d{2}-\d{2}-\d{2}$'
$DAYSBACK = 2

$DAYSBACK_DATE = (Get-Date).AddDays(-$DAYSBACK)

Write-Host "Deleting all LogFiles older than $DAYSBACK days..."
Get-ChildItem -File -Path $ROOT_PATH | Where-Object {
  $_.Name -match $FILENAME_PATTERN -and
  $_.LastWriteTime -lt $DAYSBACK_DATE
} | Remove-Item

