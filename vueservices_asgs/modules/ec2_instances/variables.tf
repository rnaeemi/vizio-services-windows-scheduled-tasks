variable "vpc_id" {}


variable "vpc_security_group_ids" {}


variable "cidr_blocks" {
  default = "0.0.0.0/0"
}

variable "tags" {
  type = map
  default = {
    "Name"                                                      = "CodeDeploy",
    "vizio:infrastructure:controlplane:application"             = "API",
    "vizio:infrastructure:controlplane:deployment-application"  = "CodeDeploy-Initial503s-App",
    "vizio:infrastructure:controlplane:deployment-group"        = "CodeDeploy-Initial503s-App-Blue-AS-DG"
  }
}