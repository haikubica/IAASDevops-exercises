variable "vpc_id" {
  description = "The id of the default VPC for your region"
}

variable "internet_gateway_id" {
  description = "The id of the internet gateway for default VPC for your region"
}

variable "prefix" {
  description = "The prefix to distinguish your AWS resources"
}

variable "uid" {
  description = "Your user id in two digit format (e.g. 05)"
}

variable "key_name" {
  description = "The name of your AWS keypair"
}

variable "ami_id" {
  default = "The AMI id of the image you created with Packer"
}
