
resource "aws_security_group" "winserver_http-rdp" {
  name = "winserver_http-rdp"

  ingress {
    description = ""
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [
      var.cidr_blocks
    ]
  }

  ingress {
    description = ""
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = [
      var.cidr_blocks
    ]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [
      var.cidr_blocks
    ]
  }

}