# Create EC2 instance using Terraform code
*Steps to create using Terraform are given below, please perform the following steps before executing the creation of the EC2 instance*
1. Go to AWS and create a keypair from the AWS UI
2. Private key will be download as a text file, example rhushi_keypair_private  ( no need to add any file extension)
3. Public key will be stored on the AWS , but this is not available for download
4. Generate the public key from the private key using the command ssh-keygen -y -f rhushi_keypair_private
5. copy the generated public key (example ssh-rsa AAAA) in a file , example rhushi_keypair_public
6. run the command chmod 400 rhushi_keypair_public
7. so we have 2 files, rhushi_keypair_private and rhushi_keypair_public
8. Go to AWS and create default VPC and configure the security group to allow traffic from your IP address ( example 10.25.568.96/32) for ssh(22), http and https
9. Now run the terraform script to create ec2 instance and this public key will be stored in the ec2  instance
10. this EC2 instance will be connected to the default security group.
11. Connect to the ec2 instance using the command ssh -i rhushi_keypair_private ec2-public-dns-name
12. Delete the EC2 instance
13. Delete the default VPC 
