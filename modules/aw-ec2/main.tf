data "aws_vpc" "main" {
}


resource "aws_instance" "ec2_instance" {
  ami                    = var.ami_id
  instance_type          = var.type
  key_name               = var.ssh_key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_groups

  root_block_device {
    volume_size = var.volume_size
  }
  disable_api_termination = true

  tags = {
    Name = "${var.name}-ec2"
  }
}

resource "aws_eip" "eip" {
  count    = var.static_ip ? 1 : 0
  instance = aws_instance.ec2_instance.id
  vpc      = true
  tags = {
    Name = "${var.name}-eip"
  }
}
