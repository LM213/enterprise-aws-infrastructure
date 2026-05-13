variable "vpc_cidr" {
  description = "CIDR block for the project VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
}
variable "private_subnet_2_cidr" {
  type = string
}

variable "availability_zone_2" {
  type = string
}