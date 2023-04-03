resource "aws_kms_key" "mykmskey" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}

resource "random_id" "number" {
  byte_length = 8
}

resource "aws_s3_bucket" "mybucketname" {
  bucket = "bootcamp30-${random_id.number.hex}-${var.mys3name}"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = aws_s3_bucket.mybucketname.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.mykmskey.arn
      sse_algorithm     = "aws:kms"
    }
  }
}