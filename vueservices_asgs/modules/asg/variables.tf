variable "service_role_arn" {}

variable "codedeploy_launchtemplate_id" {}

variable "key_name" {}

variable "vpc_id" {}

variable "vpc_security_group_ids" {}

variable "deregistration_delay" {
  default = 300
}

variable "asg_group_color" {}

variable "app_name" {}

variable "tags" {
  type = map
  default = {
    "Name"                                                      = "CodeDeploy",
    "vizio:infrastructure:controlplane:application"             = "API",
    "vizio:infrastructure:controlplane:deployment-application"  = "CodeDeploy-Initial503s-App",
    "vizio:infrastructure:controlplane:deployment-group"        = "CodeDeploy-Initial503s-App-Blue-AS-DG"
  }
}

/*
variable "tags" {
  type = map
  default = {
    Name                                                        = "CodeDeploy",
    "vizio:infrastructure:controlplane:application"             = "API",
    "vizio:infrastructure:controlplane:deployment-application"  = "CodeDeploy-Initial503s-App",
    "vizio:infrastructure:controlplane:deployment-group"        = "CodeDeploy-Initial503s-App-Blue-AS-DG"
  }
}
*/

# Define ENV (Prod, Dev, Staging)
# variable "env" {}
