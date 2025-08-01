resource "google_cloudbuild_trigger" "default" {
  name     = "trigger-cloudrun-deploy"
 filename = "cloudbuild.yaml" # pastikan file ini ada di root GitHub repo

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
