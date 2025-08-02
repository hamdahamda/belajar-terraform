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

  build {
    step {
      name = "gcr.io/cloud-builders/docker"
      args = [
        "build", "-t", var.image_url, "."
      ]
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
    # ✅ FIX: Tambahkan opsi logging agar build tidak error
    options {
      logging = "CLOUD_LOGGING_ONLY"
    }
  }

  # (Opsional jika kamu menggunakan SA tertentu)
  # substitutions = {
  #   _SERVICE_ACCOUNT = var.build_sa_email
  # }
}
