
# key pair
resource "aws_key_pair" "my_key" {
        key_name = "terra-key-file"
        public_key = file("terra-key-file.pub")
}

# VPC 

resource "aws_default_vpc" "default" {
    tags = {
      Name="Default vpc"
    }
}


# Security Group
resource "aws_security_group" "my_security_group" {
    name = "automate-SG-new"
    description = "Allow TLS inbound traffic and all outbound traffic"
    vpc_id = aws_default_vpc.default.id

    # inbound rules

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "ssh open"
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "http open"
    }

    # outbound rules
    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
        description = "All access open outbound"
    }

}

# EC2
resource "aws_instance" "my_instance" {
  # for Each is a meta argument
  # count = 2
  for_each = tomap({
    "Terraform-instances":"t2.micro"
  })
  depends_on = [ aws_key_pair.my_key , aws_security_group.my_security_group ]
  key_name = aws_key_pair.my_key.key_name
    security_groups = [aws_security_group.my_security_group.name]
    instance_type =  each.value
    ami = var.ami-key
    user_data = file("install_nginx.sh")

    root_block_device {
      volume_size = var.env == "prd" ? var.aws_volume_size : 20 //condition expression 
      volume_type = "gp3"
    }
    tags = {
      Name=each.key
      Env = var.env
    }
}

 