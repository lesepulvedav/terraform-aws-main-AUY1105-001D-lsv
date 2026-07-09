import {
  to = module.alb_module.aws_lb.main
  id = "arn:aws:elasticloadbalancing:us-east-1:087095957201:loadbalancer/app/alb-prueba2/4339599e68cd8758"
}

import {
  to = module.alb_module.aws_lb_listener.http
  id = "arn:aws:elasticloadbalancing:us-east-1:087095957201:listener/app/alb-prueba2/4339599e68cd8758/1b2f095e5d749b05"
}

import {
  to = module.alb_module.aws_lb_target_group.web
  id = "arn:aws:elasticloadbalancing:us-east-1:087095957201:targetgroup/tg-web-prueba2/f7e58d8aae5d5b54"
}

import {
  to = module.ec2_module.aws_instance.web
  id = "i-0dafb1eaf1c78011b"
}

import {
  to = module.s3_module.aws_s3_bucket.storage
  id = "8bf18bae9d788c1f3902e5268bfc9eb17ab896ab4d0d5edc41e59d575d5b56cc"
}

import {
  to = module.s3_module.aws_s3_bucket_public_access_block.storage
  id = "bucket-prueba2-82c87f6a"
}

import {
  to = module.s3_module.aws_s3_bucket_versioning.storage
  id = "bucket-prueba2-82c87f6a"
}

import {
  to = module.s3_module.random_id.suffix
  id = "82c87f6a"
}

import {
  to = module.vpc_module.aws_internet_gateway.main
  id = "igw-0db42a3ead75bea39"
}

import {
  to = module.vpc_module.aws_route_table.public
  id = "rtbassoc-0dcf23f507286c090"
}

import {
  to = module.vpc_module.aws_route_table_association.private
  id = "subnet-00cb1889aba91a27f/rtbassoc-0dae700e3fd27e832"
}

import {
  to = module.vpc_module.aws_route_table_association.public
  id = "subnet-069a7eccc63f81777/rtbassoc-0dcf23f507286c090"
}

import {
  to = module.vpc_module.aws_route_table_association.public_2
  id = "subnet-0fb69c91e2d30d7b2/rtbassoc-0b7186f840efee77e"
}

import {
  to = module.vpc_module.aws_security_group.alb
  id = "sg-0844e3f1f80488243"
}

import {
  to = module.vpc_module.aws_security_group.web
  id = "sg-0f71b1c509a523f2f"
}

import {
  to = module.vpc_module.aws_subnet.private
  id = "subnet-00cb1889aba91a27f"
}

import {
  to = module.vpc_module.aws_subnet.public
  id = "subnet-069a7eccc63f81777"
}

import {
  to = module.vpc_module.aws_subnet.public_2
  id = "subnet-0fb69c91e2d30d7b2"
}

import {
  to = module.vpc_module.aws_vpc.main
  id = "vpc-0eb44513b63bffc2f"
}