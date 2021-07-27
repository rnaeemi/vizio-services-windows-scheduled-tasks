resource "aws_lb_target_group" "CodeDeploy-TargetGroup" {
  name = "${var.app_name}-${var.asg_group_color}-TargetGroup"

  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  deregistration_delay = var.deregistration_delay
}



resource "aws_autoscaling_group" "CodeDeploy-ASGroup" {
  name = "${var.app_name}-${var.asg_group_color}-ASGroup"

  launch_template {
    id = var.codedeploy_launchtemplate_id
  }

  min_size         = 0
  desired_capacity = 0
  max_size         = 5

  availability_zones = [
    "us-west-2a"
  ]


  tag {
    key                 = "Name"
    value               = "${var.app_name}-${var.asg_group_color}-ASGroup"
    propagate_at_launch = true
  }


  
  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_codedeploy_deployment_group" "CodeDeploy-App-AS-DG" {
  app_name              = var.app_name
  deployment_group_name = "${var.app_name}-App-${var.asg_group_color}-AS-DG"
  service_role_arn      = var.service_role_arn

  deployment_config_name = "CodeDeployDefault.OneAtATime"

  deployment_style {
    deployment_option = "WITHOUT_TRAFFIC_CONTROL"
    deployment_type = "IN_PLACE"
  }

  autoscaling_groups = [
    aws_autoscaling_group.CodeDeploy-ASGroup.id
  ]

  
  auto_rollback_configuration {
    enabled = true
    events = [
      "DEPLOYMENT_FAILURE"
    ]
  }

}
