# resource "google_cloudbuild_trigger" "default" {
#   name        = "trigger-${var.service_name}"
#   description = "Trigger for ${var.service_name}"

#   github {
#     owner = var.github_owner
#     name  = var.github_repo
#     push {
#       branch = "^main$"
#     }
#   }

#   filename = "cloudbuild.yaml"
#   substitutions = {
#     _SERVICE_NAME = var.service_name
#     _IMAGE_NAME   = var.image_name
#     _REGION       = var.region
#   }
# }


resource "google_cloudbuild_trigger" "test_minimal" {
  name = "test-trigger"
  
  github {
    owner = "hamdahamda"
    name  = "latihan-css-web"
    push {
      branch = "^main$"
    }
  }

  filename = "cloudbuild.yml"
}
