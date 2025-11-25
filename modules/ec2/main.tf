variable "instance_type" { default = "t2.micro" }
variable "ami_id" {}
variable "key_name" {}
variable "subnet_id" {}
variable "security_group_ids" { type = list(string) }
resource "aws_instance" "this" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  subnet_id = var.subnet_id
  vpc_security_group_ids = var.security_group_ids
  tags = { Name = "student-driver-app-instance" }
}
