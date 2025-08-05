resource "google_cloudbuild_trigger" "github_trigger" {
  name        = var.trigger_name
  description = "Trigger to build & deploy Cloud Run from GitHub"

  github {
    owner = var.github_owner
    name  = var.github_repo

    push {
      branch = var.branch_regex
    }
  }

  filename = "cloudbuild.yaml"

  substitutions = {
    _REGION     = var.region
    _PROJECT_ID = var.project_id
    _REPO_NAME  = var.repo_name
    _SERVICE    = var.service_name
  }
}
