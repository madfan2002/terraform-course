terraform {
  backend "s3" {
      bucket = "terraform-store-rhushikesh"
      key = "terraform/state-mgmt"
  }
}