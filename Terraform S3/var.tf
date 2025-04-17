
variable "region" {
  type = string
  description = "Region of the bucket"
}

variable "bucket_name" {
    type = string
    description = "Name of the bucket"
}

variable "version_boolean" {
  type = bool
  description = "Do you want Versioning or not"
}
