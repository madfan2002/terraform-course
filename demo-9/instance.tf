resource "aws_instance" "rhushi_ubuntu_ec2" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.nano"

  # the VPC subnet
  subnet_id = aws_subnet.main-public-1.id

  # the security group
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]

  # the public SSH key
  key_name = aws_key_pair.rhushi_key_pair.key_name
}

resource "aws_ebs_volume" "ebs-volume-1" {
  availability_zone = "${var.AWS_REGION}a"
  size              = 20
  type              = "gp2"
  tags = {
    Name = "extra volume data"
  }
}

resource "aws_volume_attachment" "ebs-volume-1-attachment" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.ebs-volume-1.id
  instance_id = aws_instance.rhushi_ubuntu_ec2.id
}

output "public_ip" {
  description = "list of public ip addresses assigned to ec2 instance"
  value       = [aws_instance.rhushi_ubuntu_ec2.*.public_ip]
}
output "ec2-dns" {
  description = "dns name for ec2 instance"
  value       = [aws_instance.rhushi_ubuntu_ec2.*.public_dns]
}

