variable "AWS_ACCESS_KEY_ID" {
    type = string
}

variable "AWS_SECRET_ACCESS_KEY" {
    type = string
}

variable "AWS_REGION" {
    type = string
    default = "us-east-1"
}

variable "SECURITY_GROUPS" {
    type = list(string)
    default = ["default"]
}

variable "AMIS" {
    type = map(string)
    default = {
        "us-east-1" = "ami-090c309e8ced8ecc2"
        "us-east-2" = "ami-0403a1833008b227d"
    }
}

variable "PATH_TO_PRIVATE_KEY" {
    type = string
    default = "keys/levelup_key"
}


variable "PATH_TO_PUBLIC_KEY" {
    type = string
    default = "keys/levelup_key.pub"
}


variable "INSTANCE_USERNAME" {
    type = string
    default = "ubuntu"
}