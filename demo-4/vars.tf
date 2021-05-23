variable "AWS_ACCESS_KEY" {
}

variable "AWS_SECRET_KEY" {
}

variable "AWS_REGION" {
  default = "us-east-1"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-09e67e426f25ce0d7"
  }
}

variable "PATH_TO_PRIVATE_KEY" {
    default="rhushi-keypair-private"
  }
  
  variable "PATH_TO_PUBLIC_KEY" {
    default="rhushi-keypair-public"
  }

  variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}

