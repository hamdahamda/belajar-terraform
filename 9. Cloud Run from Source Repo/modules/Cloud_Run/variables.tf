variable "service_name" {
  description = "Nama Cloud Run service"
  type        = string
}

variable "region" {
  description = "Region GCP"
  type        = string
}

variable "image_url" {
  description = "URL Docker image di Artifact Registry"
  type        = string
}
