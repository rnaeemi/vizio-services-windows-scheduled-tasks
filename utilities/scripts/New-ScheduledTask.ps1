param (
  [Parameter(Mandatory)]
  [ValidateNotNullOrEmpty()]
  [string] $Name,

  [Parameter(Mandatory)]
  [ValidateNotNull()]
  [string] $Path,

  [Parameter(Mandatory)]
  [ValidateNotNullOrEmpty()]
  [string] $Execute,

  [Parameter(Mandatory)]
  [ValidateNotNull()]
  [string] $Argument

  <#
  [Parameter(Mandatory)]
  [hashtable] $TaskTriggerArgs
  #>
)


<#
  https://docs.microsoft.com/en-us/powershell/module/scheduledtasks/new-scheduledtasktrigger?view=win10-ps

#>

$TaskTriggerArgs = @{
  Daily = $true
  At    = '5:10pm'
}

<#
$TaskTriggerArgs = @{
  Weekly = $true
  WeeksInterval = 2
  DaysOfWeek = 'Monday'
  At = '11pm'
}
#>


$Action = New-ScheduledTaskAction -Execute $Execute -Argument $Argument
$Trigger = New-ScheduledTaskTrigger @TaskTriggerArgs
$Settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -StartWhenAvailable 
$Task = New-ScheduledTask -Action $Action -Trigger $Trigger -Settings $Settings
Register-ScheduledTask -TaskName $Name -InputObject $Task -User SYSTEM -TaskPath $Path
