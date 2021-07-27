
resource "aws_codedeploy_app" "CodeDeploy-App" {
  name = var.app_name
}


resource "aws_codedeploy_deployment_group" "CodeDeploy-App-DG" {
  app_name              = var.app_name
  deployment_group_name = "${var.app_name}-App-DG"
  service_role_arn      = aws_iam_role.CodeDeployServiceRole.arn

  deployment_config_name = "CodeDeployDefault.OneAtATime"

  ec2_tag_filter {
    key   = "Name"
    value = var.app_name
    type  = "KEY_AND_VALUE"
  }


  auto_rollback_configuration {
    enabled = true
    events = [
      "DEPLOYMENT_FAILURE"
    ]
  }

}
