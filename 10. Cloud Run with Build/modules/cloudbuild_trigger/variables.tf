variable "trigger_name" {
    default = "cloud-run-trigger-testing"
}
variable "github_owner" {}
variable "github_repo" {}
variable "github_branch" {
default = "^main$"
}
variable "image_url" {
  default = "us-central1-docker.pkg.dev/sodium-pattern-465207-m9/cloudrun-testing-with-terraform/app:latest"
}
variable "service_name" {}
variable "region" {}
variable "project_id" {
  description = "The GCP project ID"
  type        = string
}
