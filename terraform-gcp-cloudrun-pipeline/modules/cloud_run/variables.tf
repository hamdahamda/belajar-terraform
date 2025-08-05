variable "region" {
  description = "GCP region"
  type        = string
}

variable "service_name" {
  description = "Cloud Run service name"
  type        = string
}

variable "image_url" {
  description = "URL of the container image"
  type        = string
}
