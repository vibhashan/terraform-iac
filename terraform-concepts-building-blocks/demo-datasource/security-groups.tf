data "aws_ip_ranges" "us_east_ip_range" {
  regions  = ["us-east-1", "us-east-2"]
  services = ["ec2"]
}

resource "aws_security_group" "sg_custom_us_east" {
  name = "sg_custom_us_east"
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = data.aws_ip_ranges.us_east_ip_range.cidr_blocks
  }

  tags = {
    "Created Date" = data.aws_ip_ranges.us_east_ip_range.create_date
    "Sync Token"   = data.aws_ip_ranges.us_east_ip_range.sync_token
  }
}