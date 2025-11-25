cat > student-driver-app/variables.tf << 'EOF'
variable "instance_type" {
  default = "t2.micro"
}

variable "ami_id" {}
variable "key_name" {}
variable "subnet_id" {}
variable "vpc_id" {}
variable "allowed_ip" {}
variable "bucket_name" {}
EOF

