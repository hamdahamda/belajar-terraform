provider "google" {
  project = var.project_id
  region  = var.region
}

module "artifact_registry" {
  source    = "./modules/artifact_registry"
  repo_name = var.repo_name
  region    = var.region
}

# module "cloudbuild_trigger" {
#   source         = "./modules/cloudbuild_trigger"
#   trigger_name   = "auto-deploy-${var.service_name}"
#   github_owner   = var.github_owner
#   github_repo    = var.github_repo
#   github_branch  = "main"
#   image_url      = "${var.region}-docker.pkg.dev/${var.project_id}/${var.repo_name}/${var.image_name}"
#   service_name   = var.service_name
#   region         = var.region
#   project_id    = var.project_id
# }
