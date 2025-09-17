terraform {
  backend "s3" {
    bucket = "tf-state-12345"
    key    = "development/terraform-state"
    region = "us-east-2"
  }
}