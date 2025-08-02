resource "google_cloudbuild_trigger" "default" {
  name        = "trigger-${var.service_name}"
  description = "Trigger for ${var.service_name}"

  github {
    owner = var.github_owner
    name  = var.github_repo
    push {
      branch = "^main$"
    }
  }
  build {
    step {
      name = "gcr.io/cloud-builders/docker"
      args = ["build", "-t", "${var.image_name}", "."]
    }
  }
  substitutions = {
    _SERVICE_NAME = var.service_name
    _IMAGE_NAME   = var.image_name
    _REGION       = var.region
  }
}

