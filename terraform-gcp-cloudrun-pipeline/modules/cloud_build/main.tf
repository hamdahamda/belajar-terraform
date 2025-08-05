resource "google_project_service" "cloudbuild" {
  service = "cloudbuild.googleapis.com"
}

# Optional IAM if needed
resource "google_project_iam_member" "cloudbuild_service_account_permissions" {
  project = var.project_id
  role    = "roles/run.admin"
  member  = "serviceAccount:${var.project_number}@cloudbuild.gserviceaccount.com"
}
