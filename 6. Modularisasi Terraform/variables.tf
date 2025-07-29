variable "project_id" {
  description = "ID project GCP"
  type        = string
}

variable "credentials_path" {
  description = "Path ke file credentials JSON"
  type        = string
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
