variable "vpc_id" {
  type        = string
  description = "The ID of the default VPC"
  default     = "	vpc-07d8251077bacf8bd"
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "List of VPC security group IDs"
  default     = ["sg-079702d12f14ec49f"]
  
}
variable "Key_pair" {
    type        = string
    description = "The name of the key pair to use for EC2 instances"
    default     = "Universal Key"
  
}

variable "instance_type" {
  type        = string
  default     = "t3.micro"
}

variable "volume_size" {
    type        = number
    default     = 30
}

variable "volume_type" {
    type        = string
    default     = "gp3"
}