resource "aws_instance" "example" {
  count         = 1                           # Number of instances to create
  ami           = "ami-0c55b159cbfafe1f0"     # Specify the AMI ID for the instance
  instance_type = "t2.micro"                  # Specify the instance type
  
  # Specify the key pair name for SSH access
  key_name      = "your-key-pair-name"      
  
  # Specify the security group(s) for the instance
  security_groups = ["your-security-group-name"]

  # Enable public IP address for each instance
  associate_public_ip_address = true

  # Specify disk size (in GB)
  root_block_device {
    volume_size = 20   # Specify the disk size in GB
  }

  tags = {
    Name = "example-instance-${count.index + 1}"
  }
}