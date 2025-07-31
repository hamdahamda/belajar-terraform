provider "google" {
  project     = var.project_id
  region      = var.region
  credentials = var.google_credentials_json

}
module "cloud_run" {
  source       = "./modules/cloud_run"
  service_name = var.service_name
  region       = var.region
  image_url    = var.image_url
}