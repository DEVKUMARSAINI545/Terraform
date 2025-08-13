# key pairs

resource "aws_key_pair" "keypairs" {
    key_name = "terra-key"
    public_key = file("terra-key.pub")
}

# vpc
resource "aws_default_vpc" "vpc" {
    tags = {
      Name = "Default VPC"
    }
}

# security group
resource "aws_security_group" "my_security_group" {
    name = "new-securityGroup"
   description = "Allow TLS inbound traffic and all outbound traffic"
   vpc_id = aws_default_vpc.vpc.id

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

   egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
    description = "All access open outbound"
   }
   
      tags = {
       Name  = "new-SG"
   }

}


# EC2 instance


resource "aws_instance" "myinstance" {
    
    key_name = aws_key_pair.keypairs.key_name
    instance_type = "t2.micro"
 vpc_security_group_ids = [aws_security_group.my_security_group.id]
    ami =  "ami-0f918f7e67a3323f0"
  


    root_block_device {
      volume_size = 8
      volume_type = "gp3"
    }

tags = {
  Name="Terraform-ec2"
}
}

