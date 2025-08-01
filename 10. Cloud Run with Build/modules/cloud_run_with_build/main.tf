resource "google_cloudbuild_trigger" "default" {
  name     = "trigger-cloudrun-deploy"
  filename = "10. Cloud Run with Build/cloudbuild.yaml"

  github {
    owner = var.github_owner
    name  = var.github_repo
    push {
      branch = "^main$"
    }
  }

  substitutions = {
    _SERVICE_NAME = var.service_name
    _IMAGE_NAME   = var.image_name
    _REGION       = var.region
  }
}
