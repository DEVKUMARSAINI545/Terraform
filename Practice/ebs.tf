# resource "aws_ebs_volume" "volume" {
#     availability_zone = "ap-south-1a"
#     size = 8

#     tags = {
#       Name="dev_data"
#     }
  
# }

# resource "aws_volume_attachment" "my_attachment" {
#     device_name = "/dev/sdb"
#     volume_id = aws_ebs_volume.volume.id
#     instance_id = aws_instance.myinstance.id
  
# }