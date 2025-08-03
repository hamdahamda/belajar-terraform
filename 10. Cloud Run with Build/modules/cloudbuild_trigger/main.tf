resource "google_cloudbuild_trigger" "this" {
  name        = var.trigger_name
  description = "Trigger Cloud Build dari GitHub"

  github {
    owner = var.github_owner
    name  = var.github_repo
    push {
      branch = var.github_branch
    }
  }

  filename = "cloudbuild.yaml"
}
