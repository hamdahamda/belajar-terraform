resource "google_cloudbuild_trigger" "this" {
  name        = var.trigger_name
  description = "Build and deploy from GitHub"

  github {
    owner = var.github_owner
    name  = var.github_repo
    push {
      branch = var.github_branch
    }
  }

  filename = "cloudbuild.yaml"  # Ini akan mencari file di repo GitHub kamu
}
