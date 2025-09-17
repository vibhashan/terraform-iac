variable "AWS_REGION" {
  type    = string
  default = "us-east-1"
}

variable "SECURITY_GROUPS" {
  type    = list(string)
  default = ["default"]
}

variable "AMIS" {
  type = map(string)
  default = {
    "us-east-1" = "ami-090c309e8ced8ecc2"
    "us-east-2" = "ami-0403a1833008b227d"
  }
}