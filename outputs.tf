  
output "instance_id" {
  description = "Instance id of demo instance"
  value       = aws_instance.demo_instance.id
}

output "public_ip" {
  description = "Public ip of demo instance"
  value       = aws_instance.demo_instance.public_ip
}
output "private_dns" {
  description = "List of private DNS names assigned to the instances. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC"
  value       = aws_instance.demo_instance.private_dns
}
