terraform {
  required_version = ">= 1.3.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 6.0.0" # atau fix ke "6.45.0"
    }
  }
}


provider "google" {
  project     = var.project_id
  region      = var.region
  credentials = var.google_credentials_json
}

module "cloud_run_with_build" {
  source        = "./modules/cloud_run_with_build"
  project_id    = var.project_id
  region        = var.region
  image_name    = var.image_name
  service_name  = var.service_name
  github_owner  = var.github_owner
  github_repo   = var.github_repo
}
