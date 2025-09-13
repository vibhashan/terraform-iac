resource "aws_instance" "test-ec2" {
    ami = "ami-0b5ee1617e6759e0b"
    instance_type = "t2.micro"
    count = 3
    tags = {
        Name="demoinstance-${count.index + 1}"
    }

    region = "us-east-2"
}