resource "aws_security_group" "dev-demo-sg" {
  name = "dev-demo-sg"
  description = "Allow traffic for instances"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  egress {
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
}
