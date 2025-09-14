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
    default = ["sg-24076", "sg-0a5b2e", "sg-0bbf5e"]
}

variable "AMIS" {
    type = map(string)
    default = {
        "us-east-1" = "ami-0b5ee1617e6759e0b"
        "us-west-1" = "ami-0bdb828fd58c52235"
        "us-east-2" = "ami-0c55b159cbfafe1f0"
        "us-west-2" = "ami-0915bcb5fa77e4892"
    }
}