resource "aws_key_pair" "rhushi_key_pair" {
  key_name = "${var.PATH_TO_PRIVATE_KEY}"
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}
resource "aws_instance" "rhushi_ubuntu_ec2" {
   ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.nano"
  
  key_name = "${aws_key_pair.rhushi_key_pair.key_name}"
  connection {
    user = "${var.INSTANCE_USERNAME}"
    private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
    host = coalesce(self.public_ip,self.private_ip)
  }
  provisioner "local-exec" {
    command = "echo ${aws_instance.rhushi_ubuntu_ec2.public_ip} >> public_ips.txt"
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




