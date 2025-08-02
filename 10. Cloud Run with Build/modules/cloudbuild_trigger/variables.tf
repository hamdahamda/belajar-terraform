variable "trigger_name" {}
variable "github_owner" {}
variable "github_repo" {}
variable "github_branch" {
default = "main"
}

variable "image_url" {
  default = "us-central1-docker.pkg.dev/sodium-pattern-465207-m9/cloudrun-testing-with-terraform/app:latest"
}


variable "service_name" {}
variable "region" {}
