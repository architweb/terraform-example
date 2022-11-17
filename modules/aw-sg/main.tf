data "aws_vpc" "main" {
}

locals {
  ports = split(",", var.port)
}


resource "aws_security_group" "sg" {
  name        = var.name
  description = var.description
  vpc_id      = data.aws_vpc.main.id

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${var.name}-sg"
  }
}

resource "aws_security_group_rule" "ingress" {
  count             = length(local.ports)
  type              = "ingress"
  from_port         = length(split("-", local.ports[count.index])) > 1 ? split("-", local.ports[count.index])[0] : local.ports[count.index]
  to_port           = length(split("-", local.ports[count.index])) > 1 ? split("-", local.ports[count.index])[1] : local.ports[count.index]
  protocol          = "tcp"
  cidr_blocks       = var.public ? ["0.0.0.0/0"] : [data.aws_vpc.main.cidr_block]
  security_group_id = aws_security_group.sg.id
}
