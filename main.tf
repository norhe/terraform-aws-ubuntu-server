provider "aws" {
  region = var.region
}

#provider "random" {}

#resource "random_pet" "random" {
#  length = 1
#}

data "amazon-ami" "ubuntu-focal" {
  region = var.region
  filters = {
    name = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"
  }
  most_recent = true
  owners      = ["099720109477"]
}

resource "aws_instance" "app_server" {
  ami           = data.amazon-ami.ubuntu-focal.id
  instance_type = var.instance_size
  tags = {
    Name = "Approved 22.04 Image"
  }
}
