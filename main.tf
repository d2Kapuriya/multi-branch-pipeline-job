provider "aws" {
  region  = var.region
}

resource "aws_security_group" "demo_instance_sg" {
  name        = "demo_instance_sg"
  description = "Security group for demo instance"

  tags = merge(
    {
      Name   = "demo_instance_sg",
      region = var.region
    },
    var.tags
  )
}

resource "aws_security_group_rule" "web_ingress" {
  description       = "inbound rules"
  type              = "ingress"
  count             = length(var.web_ports)
  from_port         = element(var.web_ports, count.index)
  to_port           = element(var.web_ports, count.index)
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.demo_instance_sg.id
}

resource "aws_security_group_rule" "web_egress" {
  description       = "outbound rules"
  type              = "egress"
  count             = length(var.web_ports)
  from_port         = element(var.web_ports, count.index)
  to_port           = element(var.web_ports, count.index)
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.demo_instance_sg.id
}


resource "aws_instance" "demo_instance" {
  ami                         = var.images
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  user_data                   = file("user_data.sh")
  vpc_security_group_ids      = [aws_security_group.demo_instance_sg.id]

  tags = merge(
    {
      Name   = "Demo-instance",
      region = var.region
    },
    var.tags
  )
}
