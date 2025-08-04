resource "google_artifact_registry_repository" "this" {
  repository_id = var.repo_name
  format        = "DOCKER"
  location      = var.region
}