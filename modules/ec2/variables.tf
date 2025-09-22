variable "instance_ami" {
  description = "AMI for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  type        = string
}

variable "instance_name" {
  description = "Name for the EC2 instance"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet to deploy the instance"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "IDs of the security groups to attach to the instance"
  type        = list(string)
}