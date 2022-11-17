output "id" {
  value = aws_instance.ec2_instance.id
}

output "public_ip" {
  value = var.static_ip ? aws_eip.eip[0].public_ip : aws_instance.ec2_instance.public_ip
}

output "private_ip" {
  value = aws_instance.ec2_instance.private_ip
}
