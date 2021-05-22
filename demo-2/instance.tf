resource "aws_key_pair" "rhushi_key_pair" {
  key_name = "{var.PATH_TO_PRIVATE_KEY}"
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}

resource "aws_instance" "rhushi_ubuntu_ec2" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.nano"
  key_name = "${aws_key_pair.rhushi_key_pair.key_name}"

  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo sed -i -e 's/\r$//' /tmp/script.sh",  # Remove the spurious CR characters.
      "sudo /tmp/script.sh",
    ]
  }
  connection {
    host        = coalesce(self.public_ip, self.private_ip)
    type        = "ssh"
    user        = var.INSTANCE_USERNAME
    private_key = file(var.PATH_TO_PRIVATE_KEY)
  }
  
}
output "public_ip" {
  description = "list of public ip addresses assigned to ec2 instance"
  value = [aws_instance.rhushi_ubuntu_ec2.*.public_ip]
}
output "ec2-dns" {
  description = "dns name for ec2 instance"
  value = [aws_instance.rhushi_ubuntu_ec2.*.public_dns]
}

