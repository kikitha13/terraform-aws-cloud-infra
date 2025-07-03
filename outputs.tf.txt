output "instance_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.web.public_ip
}

output "ami_id" {
  description = "AMI ID used"
  value       = data.aws_ami.amazon_linux.id
}

