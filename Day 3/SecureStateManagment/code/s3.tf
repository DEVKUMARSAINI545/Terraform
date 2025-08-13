resource "aws_s3_bucket" "bucket" {
    bucket = "aws-bucket-100-1256"
    
  
}

resource "aws_s3_bucket_versioning" "versioning" {
    bucket = aws_s3_bucket.bucket.id
    versioning_configuration {
      status = "Enabled"
    }
  
}