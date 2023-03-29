provider "aws" {
  region = var.region
}

#provider "random" {}

#resource "random_pet" "random" {
#  length = 1
#}

data "aws_ami" "ubuntu-focal" {
  most_recent = true
  owners      = ["099720109477"] # Canonical
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "app_server" {
  ami           = data.aws_ami.ubuntu-focal.id
  instance_type = var.instance_size
  tags = {
    Name = "Approved 22.04 Image"
  }
}
