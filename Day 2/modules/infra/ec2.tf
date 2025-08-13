# key pairs

resource "aws_key_pair" "keypairs" {
    key_name = "terra-new-${var.env}"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDNMZbcapTtpGVoHu6LBAQa5CkLw3O4HKS2awrtnp1/acciQFng5/vkhILIWnmni4VlNF3ggfQXDYbLocwWSjmPoDIMbUvhjUn0cRb9//XGlJme1IJm9udTKD/SHyq/Z7e2c+osSGzSoMOxHwkPI7TmztG87zJR2RA2HcR0q6EBHQT4Q1iddYA62WD48jOtQ/H6vUS8tmXSdqG4JRT+KSbAweWcFCOhnSX0VGUXc2TKcgf8uGB6fGMpImEdY0vLUQCV3RNWUpv9DL7BHnF88QNm/RF/XVlHzz9/o6sROPBivY1OKwGdYfKfQm2dqF8iUkABRdvqte9phT9MnneJ9rRr3RTqHnNsMTJ6RcTfL7J/Fd7elMozPGINpYOHg2kQpTDfROsqQl1aVd5zazQF+evQ9dprXFPolhqGwGt7QeiDQVQy1tc32+KxlYZshxxZVLeyy+tBQjEjAJyg77In1L8x8ovGfSGGGg1HUkNBfK2DTuGdEZR5dZWozO4pJUEC7zE= devku@Dell"
}

# vpc
resource "aws_default_vpc" "vpc" {
    tags = {
      Name = "Default VPC"
    }
}

# security group
resource "aws_security_group" "my_security_group" {
    name = "${var.my_security_group_name}-${var.env}"
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
       Name  = "${var.env}-new-SG"
       Environment= var.env
   }

}


# EC2 instance


resource "aws_instance" "myinstance" {
    count = var.instance_count
    key_name = aws_key_pair.keypairs.key_name
    instance_type = "${var.aws_instance_type}"
 vpc_security_group_ids = [aws_security_group.my_security_group.id]
    ami ="${var.aws_ami_id}"
  


    root_block_device {
      volume_size = var.aws_volume_size
      volume_type = "gp3"
    }

tags = {
  Name="${var.env}-terraform"
  Environment = var.env
}
}

