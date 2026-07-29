aws_region = "eu-north-1"

bucket_name = "training-html-bucket-212456452289"

instance_name = "Terraform"

instance_type = "t3.micro"

ami_id = "ami-0aba19e56f3eaec05"

key_name = "HV-key"

vpc_id = "vpc-095c4e8e026ed088f"

subnet_id = "subnet-0583f55d2d6fe96c9"

associate_public_ip_address = true

tags = {
  Name        = "Terraform"
  Environment = "Dev"
  ManagedBy   = "Terraform"
}
