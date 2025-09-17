resource "aws_key_pair" "levelup_key" {
    key_name = "levelup_key"
    public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "test-ec2" {
    ami = lookup(var.AMIS, var.AWS_REGION)
    instance_type = "t2.micro"
    key_name = aws_key_pair.levelup_key.key_name
    security_groups = var.SECURITY_GROUPS # An array of security group names

    tags = {
        Name="custom_instance"
    }
    
    provisioner "file" {
        source= "./nginx-installer.sh"
        destination = "/tmp/nginx-installer.sh"
    }

    provisioner "remote-exec" {
        inline = [
            "chmod +x /tmp/nginx-installer.sh",
            "sudo sed -i -e 's/\r$//' /tmp/nginx-installer.sh", # Remove the spurious CR characters
            "sudo /tmp/nginx-installer.sh"
        ]
    }

    connection {
        host = coalesce(self.public_ip, self.private_ip)
        type = "ssh"
        user = var.INSTANCE_USERNAME
        private_key = file(var.PATH_TO_PRIVATE_KEY)
    }
}