resource "google_cloudbuild_trigger" "this" {
  name        = var.trigger_name
  description = "Build and deploy from GitHub"
  project     = var.project_id

  github {
    owner = var.github_owner
    name  = var.github_repo

    push {
      branch = var.github_branch
    }
  }

  build {
    timeout = "900s"

    step {
      name = "gcr.io/cloud-builders/docker"
      args = ["build", "-t", var.image_url, "."]
    }

    step {
      name = "gcr.io/cloud-builders/docker"
      args = ["push", var.image_url]
    }

    step {
      name       = "gcr.io/google.com/cloudsdktool/cloud-sdk"
      entrypoint = "gcloud"
      args = [
        "run", "deploy", var.service_name,
        "--image", var.image_url,
        "--region", var.region,
        "--platform", "managed",
        "--allow-unauthenticated"
      ]
    }

    images = [var.image_url]
  }
}
