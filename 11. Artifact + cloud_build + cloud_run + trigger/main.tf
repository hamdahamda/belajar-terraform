provider "google" {
  project = var.project_id
  region  = var.region
}

module "artifact_registry" {
  source     = "./modules/artifact_registry"
  region     = var.region
  repo_name  = var.repo_name
  project_id = var.project_id
}

module "cloud_run" {
  source      = "./modules/cloud_run"
  region      = var.region
  service_name = var.service_name
  image_url   = "${var.region}-docker.pkg.dev/${var.project_id}/${var.repo_name}/${var.service_name}"
}

module "cloud_build_trigger" {
  source        = "./modules/cloud_build_trigger"
  trigger_name  = "auto-deploy-${var.service_name}"
  github_owner  = var.github_owner
  github_repo   = var.github_repo
  branch_regex  = var.branch_regex
  region        = var.region
  project_id    = var.project_id
  repo_name     = var.repo_name
  service_name  = var.service_name
}