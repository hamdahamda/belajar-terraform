provider "google" {
  project = var.project_id
  region  = var.region
}

module "artifact_registry" {
  source    = "./modules/artifact_registry"
  repo_name = var.repo_name
  region    = var.region
}

module "cloud_run" {
  source = "./modules/cloud_run_service"
  service_name = var.service_name
  region       = var.region
  image_url    = var.image_url
}

