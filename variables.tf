variable "name" {
  description = "Name to be used for the VPC, EC2,..."
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ami_search_string" {
  default = "ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"
}

variable "cidr_block" {
  description = "CIDR block for the VPC"
  default     = "10.255.0.0/16"
}
