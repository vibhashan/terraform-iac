# Fetch availability zones and assign it to variable 'available_zones'
data "aws_availability_zones" "available_zones" {
}

data "aws_ami" "ubuntu_latest" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "test-ec2" {
  ami               = data.aws_ami.ubuntu_latest.id
  instance_type     = "t2.micro"
  availability_zone = data.aws_availability_zones.available_zones.names[1]
  security_groups   = [aws_security_group.sg_custom_us_east.name]

  tags = {
    Name = "custom_instance"
  }
}

output "test_ec2_public_ip" {
  value = aws_instance.test-ec2.public_ip
}