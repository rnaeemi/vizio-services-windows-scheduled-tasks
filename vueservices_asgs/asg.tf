# ami-002ca02a94671b7a2 (Windows Server 2012 R2, with CodeDeploy Agent, IIS, and ASP.NET)
resource "aws_launch_template" "CodeDeploy_LaunchTemplate" {
  name = "CodeDeploy_LaunchTemplate"

  disable_api_termination = true

  iam_instance_profile {
    name = "CodeDeploy-EC2-InstanceProfile"
  }

  image_id = "ami-002ca02a94671b7a2"

  instance_initiated_shutdown_behavior = "terminate"

  instance_type = "t2.micro"

  key_name = var.key_name

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [
      aws_security_group.winserver_http-rdp.id
    ]
  }

  placement {
    availability_zone = "us-west-2a"
  }


  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "CodeDeploy-LaunchTemplate"
    }
  }


  lifecycle {
    create_before_destroy = true
  }

}