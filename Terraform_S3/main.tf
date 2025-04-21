module "my-portfolio"{
    source = "./AWS_S3"
    region = "us-east-02"
    bucket_name = "Pulkit-Portfolio-S3-2025"
    host_file = "index.html"
    error_file = "error.html"
    version_boolean = false
    force_destroy = true
}