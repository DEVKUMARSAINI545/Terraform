variable "key_name" {
    default = "terra-key"
    type = string
}
variable "my_security_group_name" {
  default = "new-SG"
  type = string
}

variable "aws_instance_type" {
    default = "t2.micro"
    type = string
  
}
variable "aws_ami_id" {
    default = "ami-0f918f7e67a3323f0"
    type = string
  
}