variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "subnetpublic1_cidr" {
  description = "Subnet CIDR block for the first public subnet"
  type        = string
}

variable "subnetpublic2_cidr" {
  description = "Subnet CIDR block for the second public subnet"
  type        = string
}

variable "subnetprivate1_cidr" {
  description = "Subnet CIDR block for the first private subnet"
  type        = string
}

variable "availability_zone_a" {
  description = "Availability zone for the first public subnet"
  type        = string
}

variable "availability_zone_b" {
  description = "Availability zone for the second public subnet and the private subnet"
  type        = string
}

variable "name_ec2" {
  description = "Nombre de la instancia EC2"
  type        = string
}

variable "instance_type" {
  description = "Tipo de instancia EC2"
  type        = string
}

variable "alb_name" {
  description = "Nombre del Application Load Balancer"
  type        = string
}

variable "bucket_name" {
  description = "The name of the S3 bucket to create."
  type        = string
}
