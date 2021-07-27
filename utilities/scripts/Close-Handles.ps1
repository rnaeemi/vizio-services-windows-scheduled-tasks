[Parameter(Mandatory)]
[ValidateNotNull()]
[string] $TaskName

Get-ChildItem C:\terraform_managed\scripts\$TaskName | % { 
  C:\terraform_managed\utilities\Handle\handle.exe /accepteula -nobanner $_ 
} | ? { 
  $_ -match 'pid' 
} | % { 
  $p = ($_ -split '\s+')[2]; 
  $c = ($_ -split '\s+')[5]; 
  $c = $c -replace ':', ''; 
  C:\terraform_managed\utilities\Handle\handle.exe -nobanner -p $p -c $c -y
}