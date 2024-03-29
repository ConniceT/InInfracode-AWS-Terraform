variable "host_os"  {
  type        = string
  default     = "linux"
  description = "os chosen"
}

variable "aws_region" {
  description = "AWS region to deploy the resources"
  type        = string
}

variable "public_key_path" {
  description = "Path to the public key to be used for SSH access"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "allowed_ssh_cidr" {
  description = "CIDR blocks allowed SSH access to EC2 instances"
  type        = list(string)
  default     = ["0.0.0.0/0"] // Consider restricting this to specific IPs for security
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.123.0.0/16"
}

variable "subnet_cidr_block" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.123.1.0/24"
}
