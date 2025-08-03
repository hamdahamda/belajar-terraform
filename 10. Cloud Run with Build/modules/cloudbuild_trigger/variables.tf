variable "trigger_name" {
  description = "Name of the Cloud Build trigger"
  type        = string
  default     = "cloud-run-trigger-testing"
}

variable "github_owner" {
  description = "GitHub repository owner"
  type        = string
}

variable "github_repo" {
  description = "GitHub repository name"
  type        = string
}

variable "github_branch" {
  description = "GitHub branch to trigger builds from"
  type        = string
  default     = "^main$"
}

variable "image_url" {
  description = "URL of the container image"
  type        = string
  default     = "us-central1-docker.pkg.dev/sodium-pattern-465207-m9/cloudrun-testing-with-terraform/app:latest"
}

variable "service_name" {
  description = "Cloud Run service name"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
}

variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "build_sa_email" {}  # Email SA yang punya akses deploy Cloud Run
