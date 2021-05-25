# Create a security group and allow only traffic from europe (allow only CIDR blocks from europe to connect)

# Create a default VPC

# Run the script and check if the security group from_europe is created with CIDR blocks that allow traffic on tcp/443

# Destroy the default VPC and security group manually from VPC

# Commands that are used frequently

1. terraform init
2. terraform plan
3. terraform apply
4. terraform destroy
5. terraform show -json (display as json)
6. terraform fmt vpc.tf (format the tf files)
7. terraform import aws_instance.example i-0bda46c8e5c461e6a (this ID can be obtained from AWS console, import the resource in terraform state)
