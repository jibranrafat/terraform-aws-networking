# terraform-aws-networking
Networking Module created as practice

This module manages creation of VPC's and Subnets, allowing
for the creation of both private and public subnets

Example usage:

```
module "networking" {
    source = "./modules/networking"
    vpc_config = {
        cidr_block = "10.0.0.0/16"
        name = "<your_name>"
    }
    subnet_config = {
        subnet_1 = {
            cidr_block = "10.0.0.0/24"
            az = "eu-west-1a"
        }
    }
}
```
