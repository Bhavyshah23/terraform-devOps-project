data "aws_vpc" "selected" {
  id = var.vpc_id
}
data "aws_security_group" "selected_sg" {
  id = var.vpc_security_group_ids[0]
}
data "aws_subnets" "default_VPC_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
}


data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "ubuntu_ec2" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = var.Key_pair
  subnet_id              = data.aws_subnets.default_VPC_subnets.ids[0]
  vpc_security_group_ids = [data.aws_security_group.selected_sg.id]

  root_block_device {
    volume_size = var.volume_size
    volume_type = var.volume_type
  }

  tags = {
    Name = "Ubuntu-22-EC2"
  }
}
