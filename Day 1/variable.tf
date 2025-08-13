variable "ami-key" {
    default = "ami-0d0ad8bb301edb745"
    type = string
}
variable "key_name" {
  default ="terra-key-file"
  type = string
}
variable "aws_volume_size" {
  default = 8
  type = number
  
}

variable "env" {
  default = "prd"
  type = string
}