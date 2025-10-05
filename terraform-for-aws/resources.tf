resource "aws_ebs_volume" "ebs_volume_1" {
  availability_zone = "us-east-2a"
  size              = 50
  type              = "gp2"

  tags = {
    Name = "Secondary Volume Disk"
  }
}

resource "aws_instance" "my_instance" {
  ami           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type = "t2.micro"

  tags = {
    Name = "Custom Instance"
  }
}

# Attach EBS volume with EC2
resource "aws_volume_attachment" "ebs_volume_attachmenterraform" {
    device_name = "/dev/xvdh"
    volume_id   = aws_ebs_volume.ebs_volume_1.id
    instance_id = aws_instance.my_instance.id
}
