provider "aws" {
  region = "us-west-2"
}


module "asg_blue" {
  source = "./modules/asg"

  service_role_arn = aws_iam_role.CodeDeployServiceRole.arn

  codedeploy_launchtemplate_id = aws_launch_template.CodeDeploy_LaunchTemplate.id

  app_name = aws_codedeploy_app.CodeDeploy-App.name

  key_name = var.key_name

  asg_group_color = "Blue"

  deregistration_delay = 3

  vpc_id = var.vpc_id

  vpc_security_group_ids = [
    aws_security_group.winserver_http-rdp.id
  ]
}


module "asg_green" {
  source = "./modules/asg"

  service_role_arn = aws_iam_role.CodeDeployServiceRole.arn

  codedeploy_launchtemplate_id = aws_launch_template.CodeDeploy_LaunchTemplate.id

  app_name = aws_codedeploy_app.CodeDeploy-App.name

  key_name = var.key_name

  asg_group_color = "Green"

  vpc_id = var.vpc_id

  vpc_security_group_ids = [
    aws_security_group.winserver_http-rdp.id
  ]
}


module "asg_black" {
  source = "./modules/asg"

  service_role_arn = aws_iam_role.CodeDeployServiceRole.arn

  codedeploy_launchtemplate_id = aws_launch_template.CodeDeploy_LaunchTemplate.id

  app_name = aws_codedeploy_app.CodeDeploy-App.name

  key_name = var.key_name

  asg_group_color = "Black"

  vpc_id = var.vpc_id

  vpc_security_group_ids = [
    aws_security_group.winserver_http-rdp.id
  ]
}
