/*
1. VPC ID
2. Object of Public Subnets - ID
3. Object of Private Subnets - ID
*/

locals {
  output_public_subnets = {
    for key in keys(local.public_subnets) : key => {
      subnet_id         = aws_subnet.this[key].id
      availability_zone = aws_subnet.this[key].availability_zone
    }
  }
  output_private_subnets = {
    for key in keys(local.private_subnets) : key => {
      subnet_id         = aws_subnet.this[key].id
      availability_zone = aws_subnet.this[key].availability_zone
    }
  }
}
output "public_subnets" {
  value = local.output_public_subnets
}

output "vpc_id" {
  value       = aws_vpc.this.id
  description = "The AWS VPC ID that is created"
}

output "private_subnets" {
  value = local.output_private_subnets
}

