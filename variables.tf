variable "aws_region" {
  type = string
}

variable "bucket_name" {
  type = string
}

variable "instance_name" {
  type = string
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "key_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "associate_public_ip_address" {
  type = bool
}

variable "tags" {
  type = map(string)
}
