variable "region" {
  type = string
  description = "Region of the bucket"
  default = "us-east-02"
}

variable "bucket_name" {
    type = string
    description = "Name of the bucket"
    default = "Pulkit-Portfolio-Bucket-2025"
}

variable "version_boolean" {
  type = bool
  description = "Do you want Versioning or not"
  default = true
}

variable "host_file" {
  type = string
  description = "HTML File that will be hosted"
  default = "index.html"
}

variable "error_file" {
  type = string
  description = "Error HTML file"
  default = "error.html"
}

variable "force_destroy" {
  type = bool
  description = "Force Destroy Bucket"
  default = true
}