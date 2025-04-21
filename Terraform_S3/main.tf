module "my-portfolio"{
    source = "./AWS_S3"
    region = "us-east-02"
    bucket_name = "pulkit-portfolio-s3-2025"
    host_file = "index.html"
    error_file = "error.html"
    version_boolean = false
    force_destroy = true
}
output "bucket_name" {
  value = module.my-portfolio.bucket_name
}
output "website_url" {
  value = aws_s3_bucket_website_configuration.static_site_on.website_endpoint
}