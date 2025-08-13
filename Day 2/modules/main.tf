module "dev-infra" {
    source = "./infra"
    env = "dev"
    my_security_group_name = "new-SG-new"
    aws_instance_type = "t2.micro"
    aws_ami_id = "ami-0f918f7e67a3323f0"
    aws_volume_size = 8
    instance_count = 1
}
module "prd-infra" {
    source = "./infra"
    env = "prd"
    my_security_group_name = "new-SG-new"
    aws_instance_type = "t2.micro"
    aws_ami_id = "ami-0f918f7e67a3323f0"
    aws_volume_size = 8
    instance_count = 1
}
# module "test-infra" {
#     source = "./infra"
#     env = "test"
#     my_security_group_name = "new-SG-new"
#     aws_instance_type = "t2.micro"
#     aws_ami_id = "ami-0f918f7e67a3323f0"
#     aws_volume_size = 8
#     instance_count = 1
# }