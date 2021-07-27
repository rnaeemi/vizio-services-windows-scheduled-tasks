resource "aws_iam_role" "CodeDeploy-EC2-InstanceProfile" {
  name = "CodeDeploy-EC2-InstanceProfile"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      }
    }
  ]
}
EOF
}


resource "aws_iam_instance_profile" "CodeDeploy-EC2-InstanceProfile" {
  name = "CodeDeploy-EC2-InstanceProfile"
  role = aws_iam_role.CodeDeploy-EC2-InstanceProfile.name
}

resource "aws_iam_role_policy" "CodeDeploy-EC2-Permissions" {
  name = "CodeDeploy-EC2-Permissions"
  role = aws_iam_role.CodeDeploy-EC2-InstanceProfile.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:Get*",
        "s3:List*"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:s3:::vizio-sandbox-fileshare/codedeploy/*",
        "arn:aws:s3:::aws-codedeploy-us-west-2/*"
      ]
    }
  ]
}
EOF
}


resource "aws_iam_role" "CodeDeployServiceRole" {
  name = "CodeDeployServiceRole"


  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "codedeploy.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "AWSCodeDeployRole" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSCodeDeployRole"
  role       = aws_iam_role.CodeDeployServiceRole.name
}