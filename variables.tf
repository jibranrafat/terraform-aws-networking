
variable "vpc_config" {
description = "Contains the VPC configuration. The cidr_block and vpc_name to be specific"
  type = object({
    cidr_block = string
    name       = string
  })
  validation {
    condition     = can(cidrnetmask(var.vpc_config.cidr_block))
    error_message = "The cidr_block config option must contain a valid cidr_block "
  }
}

variable "subnet_config" {
description = <<EOT
Accepts a map of subnet configuration. Each subnet configuration should contain

cidr_block  : The CIDR block of the subnet
public      : Weather the subnet should be public or not (default to false)
az          : The availability zone where to deploy the subnet
EOT
  type = map(object({
    cidr_block = string
    public     = optional(bool, false)
    az         = string
  }))
  validation {
    condition = alltrue([
      for config in values(var.subnet_config) : can(cidrnetmask(config.cidr_block))
    ])
    error_message = "The cidr_block config option must contain a valid cidr_block "
  }
}