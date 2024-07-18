variable "subnet_ids" {
  description = "The subnet IDs for the EKS cluster"
  type        = list(string)
}

variable "vpc_id" {
  description = "The VPC ID for the EKS cluster"
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

variable "web_app_sg_id" {
  description = "The security group ID for the web application nodes"
}
