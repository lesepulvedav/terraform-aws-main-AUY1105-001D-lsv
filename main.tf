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

module "vpc_module" {
  source              = "git::https://github.com/lesepulvedav/terraform-aws-vpc-AUY1105-001D-lsv.git?ref=v0.2.4"
  vpc_name            = var.vpc_name
  cidr_block          = var.cidr_block
  subnetpublic1_cidr  = var.subnetpublic1_cidr
  subnetpublic2_cidr  = var.subnetpublic2_cidr
  subnetprivate1_cidr = var.subnetprivate1_cidr
  availability_zone_a = var.availability_zone_a
  availability_zone_b = var.availability_zone_b
}

module "ec2_module" {
  source             = "git::https://github.com/lesepulvedav/terraform-aws-ec2-AUY1105-001D-lsv.git?ref=v0.2.0"
  subnet_id          = module.vpc_module.public_subnet_id
  security_group_ids = [module.vpc_module.security_group_web_id]
  name_ec2           = var.name_ec2
  instance_type      = var.instance_type
}

module "s3_module" {
  source      = "git::https://github.com/lesepulvedav/terraform-aws-s3-AUY1105-001D-lsv.git?ref=v0.1.0"
  bucket_name = var.bucket_name
}

module "alb_module" {
  source             = "git::https://github.com/lesepulvedav/terraform-aws-alb-AUY1105-001D-lsv.git?ref=v0.2.2"
  subnets            = [module.vpc_module.public_subnet_id, module.vpc_module.public_subnet_2_id]
  security_group_ids = [module.vpc_module.security_group_alb_id]
  vpc_id             = module.vpc_module.vpc_id
  instance_id        = module.ec2_module.instance_id
  alb_name           = var.alb_name

}

# ─── OUTPUTS ───────────────────────────────────────────────────────────────────
output "vpc_id" {
  value = module.vpc_module.vpc_id
}

output "ec2_public_ip" {
  value = module.ec2_module.instance_public_ip
}

output "s3_bucket_name" {
  value = module.s3_module.bucket_name
}

output "alb_dns_name" {
  description = "DNS publico del Application Load Balancer"
  value       = module.alb_module.alb_dns_name
}

output "alb_arn" {
  description = "ARN del Application Load Balancer"
  value       = module.alb_module.alb_arn
}
