resource "aws_key_pair" "rhushi_key_pair" {
  key_name   = "${var.PATH_TO_PRIVATE_KEY}"
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}


