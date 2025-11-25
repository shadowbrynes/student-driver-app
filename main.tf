cat > student-driver-app/main.tf << 'EOF'
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = var.bucket_name
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

# Security Group Module
module "security_group" {
  source    = "./modules/security_group"
  vpc_id    = var.vpc_id
  allowed_ip = var.allowed_ip
}

# EC2 Module
module "ec2_instance" {
  source             = "./modules/ec2"
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  key_name           = var.key_name
  subnet_id          = var.subnet_id
  security_group_ids = [module.security_group.id]
}

# S3 Backend Module
module "s3_backend" {
  source      = "./modules/s3_backend"
  bucket_name = var.bucket_name
}
EOF

