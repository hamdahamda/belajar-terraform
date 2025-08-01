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