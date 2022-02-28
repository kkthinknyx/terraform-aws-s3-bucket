resource "random_string" "random" {
  length  = 4
  special = false
  upper   = false
}

resource "aws_s3_bucket" "test-bucket" {
  count  = var.bucket-count
  bucket = join("", [var.bucket-name, "-", random_string.random.result, "-", count.index])
  tags = {
    Name = join("", [var.bucket-name, count.index])
  }
}

resource "aws_s3_bucket_acl" "test-acl" {
  count  = length(aws_s3_bucket.test-bucket)
  bucket = aws_s3_bucket.test-bucket[count.index].id
  acl    = "private"
}