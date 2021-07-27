
# Make separate Function 

$jsonBase = @{}

Get-Content -Path C:\aws_service_credentials\credentials | ForEach-Object {
    

  if ($_ -eq "") {
    Write-Debug "Detected empty string"
    return
  }
    
  #  If line (string) is credential profile name "[profilename]"
  if ($_.StartsWith('[') -and $_.EndsWith(']')) {
    # Get profile name by removing the first '[' and last characters ']'
    $profileName = $_.Substring(1, $_.length - 2)

    return
  }
    

  $arr = $_.split('=')
  $data = @{ $arr[0] = $arr[1] }

  $jsonBase[$profileName] += $data
}


$TodaysDate = Get-Date -format "yyyy-MM-dd"
# $TodaysDate = 2020-08-29


$uri = "https://vpc-search-prod-7-7-qdqlwnzzzxf27vsw6ocwv43wwe.us-west-2.es.amazonaws.com/_snapshot/vizio-prod-elasticsearch-backups/$TodaysDate-vizio-nested-search-index-prod-alias"

$headers = @{ 
  'Authentication'  = "$($jsonBase.default.aws_secret_access_key)"
  'Accept'          = '*/*'
  'Accept-Encoding' = 'gzip, deflate, br'
  'Content-Type'    = "application/json"
}

$body = @{
  "indices"              = "vizio-nested-search-index-prod-alias"
  "ignore_unavailable"   = "true"
  "include_global_state" = "false"
} | ConvertTo-Json


Write_Host "Invoking REST Method (Put) against $uri..."
Invoke-RestMethod -Method PUT -Uri $uri -Headers $headers -Body $body


