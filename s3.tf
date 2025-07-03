resource "aws_s3_bucket" "my_bucket1" {
  bucket = "my-s3-bucket30"

  tags = {
    Name        = "my-s3-bucket30"
    force_destroy = true    #this delete the bucket whether it's empty or not
  }
}
