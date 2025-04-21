resource "aws_s3_bucket" "static_site" {
  bucket = var.bucket_name
  force_destroy = var.force_destroy
}

resource "aws_s3_bucket_versioning" "s3_version" {
  bucket = aws_s3_bucket.static_site.id

  versioning_configuration {
    status = var.version_boolean ? "Enabled" : "Suspended"
  }
}

resource "aws_s3_bucket_website_configuration" "static_site_on" {
  bucket = aws_s3_bucket.static_site.id

  index_document {
  suffix = var.host_file
  }

  error_document {
  key = var.error_file
  }
}

resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.static_site.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "public_read_policy" {
  bucket = aws_s3_bucket.static_site.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "PublicReadGetObject",
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:GetObject",
        Resource  = "${aws_s3_bucket.static_site.arn}/*"
      }
    ]
  })

  depends_on = [aws_s3_bucket_public_access_block.public_access]
}

output "bucket_name" {
  value = aws_s3_bucket.static_site.bucket
}

output "website_url" {
  value = aws_s3_bucket_website_configuration.static_site_on.website_endpoint
}
