output "public_ip" {
  value = "${aws_instance.dev-server.public_dns}"
}
