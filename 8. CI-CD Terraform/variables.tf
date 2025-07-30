variable "project_id" {
  description = "ID project GCP"
  type        = string
}
variable "google_credentials_json" {
  description = "Isi file JSON credentials dari secrets"
  type        = string
  sensitive   = true
}

variable "region" {
  description = "Region tempat resource dibuat"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "Zone tempat resource dibuat"
  type        = string
  default     = "us-central1-a"
}
