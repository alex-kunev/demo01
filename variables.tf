# List of Variables

variable "region_name" {
  description = "Value of the Region for the EC2 instance"
  type        = string
  default     = "us-east-1"
}

variable "image_id" {
  description = "AMI type for the EC2 instance"
  type        = string
  default     = "ami-0b0dcb5067f052a63"
}

variable "instance_name_1" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "D01_Jenkins"
}

variable "instance_name_2" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "D01_Jenkins"
}
