terraform {
  backend "gcs" {
    bucket  = "nama-bucket-terraform"
    prefix  = "state/cloudrun"
  }
}
