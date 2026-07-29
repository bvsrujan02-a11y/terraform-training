output "public_ip" {

  value = aws_instance.training_ec2.public_ip

}

output "public_dns" {

  value = aws_instance.training_ec2.public_dns

}

output "instance_id" {

  value = aws_instance.training_ec2.id

}

output "bucket_name" {

  value = aws_s3_bucket.training_bucket.bucket

}

output "security_group" {

  value = aws_security_group.ec2_sg.id

}

