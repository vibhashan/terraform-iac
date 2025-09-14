resource "aws_instance" "test-ec2" {
    ami = lookup(var.AMIS, var.AWS_REGION)
    instance_type = "t2.micro"
    tags = {
        Name="demoinstance"
    }
    security_groups = var.SECURITY_GROUPS
}