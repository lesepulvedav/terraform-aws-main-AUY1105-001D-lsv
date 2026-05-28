terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "alb_module" {
  source = "git::https://github.com/lesepulvedav/terraform-aws-alb-AUY1105-001D-lsv.git?ref=v0.1.1"
  
}

module "ec2_module" {
  source = "git::https://github.com/lesepulvedav/terraform-aws-ec2-AUY1105-001D-lsv.git?ref=v0.1.0"
  vpc_id = module.vpc_module.vpc_id
  public_subnet_id = module.vpc_module.public_subnet_id
  private_subnet_id = module.vpc_module.private_subnet_id
}

module "s3_module" {
  source = "git::https://github.com/lesepulvedav/terraform-aws-s3-AUY1105-001D-lsv.git?ref=v0.1.0"
}

module "vpc_module" {
  source = "git::https://github.com/lesepulvedav/terraform-aws-vpc-AUY1105-001D-lsv.git?ref=v0.1.0"
}

# ─── OUTPUTS ───────────────────────────────────────────────────────────────────
output "vpc_id" {
  value = aws_vpc.main.id
}

output "ec2_public_ip" {
  value = aws_instance.web.public_ip
}

output "s3_bucket_name" {
  value = aws_s3_bucket.storage.bucket
}

output "alb_dns_name" {
  description = "DNS publico del Application Load Balancer"
  value       = aws_lb.main.dns_name
}

output "alb_arn" {
  description = "ARN del Application Load Balancer"
  value       = aws_lb.main.arn
}
