variable "project_id" {
  description = "ID project GCP"
  type        = string
}

variable "region" {
  description = "Region tempat VM dibuat"
  type        = string
}

variable "zone" {
  description = "Zone tempat VM dibuat"
  type        = string
}

variable "credentials_path" {
  description = "Path ke service account credentials file (.json)"
  type        = string
}
