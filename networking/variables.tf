variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "num_public_subnets" {
  description = "The number of public subnets to create"
  default     = 2
}

variable "num_private_subnets" {
  description = "The number of private subnets to create"
  default     = 2
}

variable "availability_zones" {
  description = "The availability zones to deploy subnets in"
  type        = list(string)
  default     = ["us-west-2a", "us-west-2b"]
}
