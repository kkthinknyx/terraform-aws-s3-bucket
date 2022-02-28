variable "bucket-name" {
  type    = string
  default = "myexample-bucket"
  description = "only lowercase alphanumeric characters and hyphens allowed in bucket name"
}

variable "bucket-count" {
  type        = number
  default     = 1
  description = "Number of buckets to be created"
}

