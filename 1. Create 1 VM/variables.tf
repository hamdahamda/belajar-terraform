variable "project_id" {
  description = "ID project GCP"
  type        = string
}

variable "region" {
  description = "Region tempat VM dibuat"
  default     = "us-central1"
}

variable "zone" {
  description = "Zone tempat VM dibuat"
  default     = "us-central1-a"
}

variable "credentials_path" {
  description = "Path ke credentials file"
  type        = string
}
