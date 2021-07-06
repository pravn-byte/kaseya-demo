resource "aws_instance" "dev-server" {
  ami             = "${data.aws_ami.ubuntu.id}"
  instance_type   = "${var.instance_type}"
  key_name        = "${var.key_name}"
  vpc_security_group_ids = [ "${aws_security_group.dev-demo-sg.id}" ]
  user_data       = "${file("userdata.sh")}"
  lifecycle {
    create_before_destroy = true
  }
}
