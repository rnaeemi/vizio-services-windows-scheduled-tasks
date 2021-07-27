
module "Cleanup_IIS_LogFiles" {
  source = "./modules/task"

  name            = "Cleanup_IIS_LogFiles"
  script_filename = "Cleanup-IIS-LogFiles.ps1"
  task_path       = "\\${var.org_name}\\"
  admin_username  = var.admin_username
  admin_password  = var.admin_password
  list_of_winservers = [
    "ip-0A7406C9.seadata.vizio.com",
    "ip-0A7405A9.seadata.vizio.com",
    "ip-0A7400B6.seadata.vizio.com",
    "ip-0A740092.seadata.vizio.com",
    "ip-0A740629.seadata.vizio.com",
    "ip-0A740524.seadata.vizio.com",
    "ip-0A7406B1.seadata.vizio.com",
    "ip-0A74057F.seadata.vizio.com",
    "ip-0A74063E.seadata.vizio.com",
    "ip-0A740663.seadata.vizio.com",
    "ip-0A740677.seadata.vizio.com",
    "ip-0A740A3A.seadata.vizio.com",


    #Vue-API-Even (BLUE) Target Group
    # api-A-2 (ip-0A740055)
    "ip-0A740055.seadata.vizio.com",
    # api-A-4 (ip-0A740042)
    "ip-0A740042.seadata.vizio.com",
    # api-A-6 (ip-0A740053)
    "ip-0A740053.seadata.vizio.com",
    # api-C-2 (ip-0A740A6D)
    "ip-0A740A6D.seadata.vizio.com",
    # api-C-4 (ip-0A740A04)
    "ip-0A740A04.seadata.vizio.com",


    #Vue-API-Odd (GREEN) Target Group
    # api-A-1 (ip-0A740054)
    "ip-0A740054.seadata.vizio.com",
    # api-C-1 (ip-0A740A6E)
    "ip-0A740A6E.seadata.vizio.com",
    # api-C-3 (ip-0A740A37)
    "ip-0A740A37.seadata.vizio.com",
    # api-C-5 (ip-0A740AB8)
    "ip-0A740AB8.seadata.vizio.com",
    # api-A-5 (ip-0A740093)
    "ip-0A740093.seadata.vizio.com",
    # api-A-3 (ip-0A740030)
    "ip-0A740030.seadata.vizio.com",


   #Vue-API-911
    # "ip-0A740ABF.seadata.vizio.com",
    "ip-0A740ABC.seadata.vizio.com",
    # "ip-0A740AE5.seadata.vizio.com",
    # "ip-0A7464F7.seadata.vizio.com",
    "ip-0A746482.seadata.vizio.com",
    # "ip-0A7464D8.seadata.vizio.com"
  ]
  action_execute   = "powershell.exe"
  action_arguments = "-ExecutionPolicy Bypass -File \"C:\\terraform_managed\\scripts\\Cleanup_LogFiles\\Cleanup-LogFiles.ps1\""
}


module "Cleanup_LogFiles" {
  source = "./modules/task"

  name            = "Cleanup_LogFiles"
  script_filename = "Cleanup-LogFiles.ps1"
  task_path       = "\\${var.org_name}\\"
  admin_username  = var.admin_username
  admin_password  = var.admin_password
  list_of_winservers = [
    "ip-0A7406C9.seadata.vizio.com",
    "ip-0A7405A9.seadata.vizio.com",
    "ip-0A7400B6.seadata.vizio.com",
    "ip-0A740092.seadata.vizio.com",
    "ip-0A740629.seadata.vizio.com",
    "ip-0A740524.seadata.vizio.com",
    "ip-0A7406B1.seadata.vizio.com",
    "ip-0A74057F.seadata.vizio.com",
    "ip-0A74063E.seadata.vizio.com",
    "ip-0A740663.seadata.vizio.com",
    "ip-0A740677.seadata.vizio.com",
    "ip-0A740A3A.seadata.vizio.com",


    "ip-0A740055.seadata.vizio.com",

    #Vue-API-Even (BLUE) Target Group
    # api-A-2 (ip-0A740055)
    "ip-0A740055.seadata.vizio.com",
    # api-A-4 (ip-0A740042)
    "ip-0A740042.seadata.vizio.com",
    # api-A-6 (ip-0A740053)
    "ip-0A740053.seadata.vizio.com",
    # api-C-2 (ip-0A740A6D)
    "ip-0A740A6D.seadata.vizio.com",
    # api-C-4 (ip-0A740A04)
    "ip-0A740A04.seadata.vizio.com",


    #Vue-API-Odd (GREEN) Target Group
    # api-A-1 (ip-0A740054)
    "ip-0A740054.seadata.vizio.com",
    # api-C-1 (ip-0A740A6E)
    "ip-0A740A6E.seadata.vizio.com",
    # api-C-3 (ip-0A740A37)
    "ip-0A740A37.seadata.vizio.com",
    # api-C-5 (ip-0A740AB8)
    "ip-0A740AB8.seadata.vizio.com",
    # api-A-5 (ip-0A740093)
    "ip-0A740093.seadata.vizio.com",
    # api-A-3 (ip-0A740030)
    "ip-0A740030.seadata.vizio.com",


   #Vue-API-911
    # "ip-0A740ABF.seadata.vizio.com",
    "ip-0A740ABC.seadata.vizio.com",
    # "ip-0A740AE5.seadata.vizio.com",
    # "ip-0A7464F7.seadata.vizio.com",
    "ip-0A746482.seadata.vizio.com",
    # "ip-0A7464D8.seadata.vizio.com"
  ]
  action_execute   = "powershell.exe"
  action_arguments = "-ExecutionPolicy Bypass -File \"C:\\terraform_managed\\scripts\\Cleanup_LogFiles\\Cleanup-LogFiles.ps1\""
}


module "Reset_GracePeriod" {
  source = "./modules/task"

  name            = "Reset_GracePeriod"
  script_filename = "Reset-GracePeriod.ps1"
  task_path       = "\\${var.org_name}\\"
  admin_username  = var.admin_username
  admin_password  = var.admin_password
  list_of_winservers = [
    "IP-0A740011.seadata.vizio.com",
    # "IP-0A7400AE.seadata.vizio.com",
    # "VUE-MASTER-AMI.seadata.vizio.com",
    "FeedValidator.seadata.vizio.com"


  ]
  action_execute   = "powershell.exe"
  action_arguments = "-ExecutionPolicy Bypass -File \"C:\\terraform_managed\\scripts\\Reset_GracePeriod\\Reset-GracePeriod.ps1\""
}


module "Put_SnapshotElasticSearch_content-search-index-prod" {
  source = "./modules/task"

  name            = "Put_SnapshotElasticSearch_content-search-index-prod"
  script_filename = "Put-SnapshotElasticSearch-content-search-index-prod.ps1"
  task_path       = "\\${var.org_name}\\"
  admin_username  = var.admin_username
  admin_password  = var.admin_password
  list_of_winservers = [
    "h1a.seadata.vizio.com"
  ]
  action_execute   = "powershell.exe"
  action_arguments = "-ExecutionPolicy Bypass -File \"C:\\terraform_managed\\scripts\\Put_SnapshotElasticSearch_content-search-index-prod\\Put-SnapshotElasticSearch-content-search-index-prod.ps1\""
}



module "Put_SnapshotElasticSearch_nested-search-index-prod-alias" {
  source = "./modules/task"

  name            = "Put_SnapshotElasticSearch_nested-search-index-prod-alias"
  script_filename = "Put-SnapshotElasticSearch-nested-search-index-prod-alias.ps1"
  task_path       = "\\${var.org_name}\\"
  admin_username  = var.admin_username
  admin_password  = var.admin_password
  list_of_winservers = [
    "h1a.seadata.vizio.com"
  ]
  action_execute   = "powershell.exe"
  action_arguments = "-ExecutionPolicy Bypass -File \"C:\\terraform_managed\\scripts\\Put_SnapshotElasticSearch_nested-search-index-prod-alias\\Put-SnapshotElasticSearch-nested-search-index-prod-alias.ps1\""
}

/*
$TaskTriggerArgs = @{
  Weekly = $true
  WeeksInterval = 2
  DaysOfWeek = 'Monday'
  At = '3pm'
}
*/
