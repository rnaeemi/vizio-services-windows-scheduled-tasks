data "template_file" "user_data" {
  template = file("./userdata.txt")
}


# ami-0cc1e13429ee204c4 (Windows Server 2012 R2)
resource "aws_instance" "CodeDeploy" {
  ami                    = "ami-0cc1e13429ee204c4"
  instance_type          = "t2.micro"
  vpc_security_group_ids = var.vpc_security_group_ids

  subnet_id = "subnet-71f58e08"

  key_name             = "CICD-DevOps-Testing"
  iam_instance_profile = "CodeDeploy-EC2-InstanceProfile"

  user_data = data.template_file.user_data.rendered

}