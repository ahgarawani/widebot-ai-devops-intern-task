variable "region" {
  description = "The AWS region to deploy resources in"
  default     = "us-west-2"
}

variable "domain_name" {
  description = "The domain name for the web application"
}

variable "ssl_certificate_arn" {
  description = "The ARN of the SSL certificate"
}

variable "asg_desired_capacity" {
  description = "Desired capacity for the Auto Scaling Group"
  default     = 2
}

variable "asg_max_capacity" {
  description = "Maximum capacity for the Auto Scaling Group"
  default     = 3
}

variable "asg_min_capacity" {
  description = "Minimum capacity for the Auto Scaling Group"
  default     = 1
}

variable "instance_type" {
  description = "Instance type for the Auto Scaling Group"
  default     = "t3.medium"
}
