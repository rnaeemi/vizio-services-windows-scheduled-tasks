resource null_resource scheduled_task {
  for_each = toset(var.list_of_winservers)

  # triggers - (Optional) A map of arbitrary strings that, when changed, will force the null resource to be replaced, re-running any associated provisioners.
  triggers = {
    script_file_name_content_ps1_content = filesha512("scripts/${var.name}/${var.script_filename}")

    utilities_scripts_New-ScheduledTask_ps1_content = filesha512("utilities/scripts/New-ScheduledTask.ps1")
    utilities_scripts_Closed-Handles_ps1_content    = filesha512("utilities/scripts/Close-Handles.ps1")

    utilities_Handle_Eula_txt_content     = filesha512("utilities/Handle/Eula.txt")
    utilities_Handle_handle_exe_content   = filesha512("utilities/Handle/handle.exe")
    utilities_Handle_handle64_exe_content = filesha512("utilities/Handle/handle64.exe")
  }

  connection {
    type     = "winrm"
    user     = var.admin_username
    password = var.admin_password
    https    = false
    use_ntlm = true
    host     = each.key
    timeout  = "5s"
  }

  provisioner "file" {
    source      = "utilities"
    destination = "C:/terraform_managed/utilities"
  }

  provisioner "file" {
    source      = "scripts/${var.name}"
    destination = "C:/terraform_managed/scripts/${var.name}"
  }

  provisioner "remote-exec" {
    inline = [
      "powershell.exe -ExecutionPolicy Bypass -File C:\\terraform_managed\\utilities\\scripts\\New-ScheduledTask.ps1 -Name \"${var.name}\" -Path ${var.task_path} -Execute \"${var.action_execute}\" -Argument \"${var.action_arguments}\""
    ]
  }

  provisioner "remote-exec" {
    when = destroy
    inline = [
      "SCHTASKS /Delete /F /TN \"${var.task_path}${var.name}\"", # Deletes Task
      "powershell.exe -ExecutionPolicy Bypass -File C:\\terraform_managed\\utilities\\scripts\\Close-Handles.ps1 -TaskName ${var.name}",
      "if exist C:\\terraform_managed\\scripts\\${var.name} rd /q /s \"C:\\terraform_managed\\scripts\\${var.name}\""
    ]
  }

}
