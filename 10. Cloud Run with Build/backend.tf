terraform {
  backend "gcs" {
    bucket  = "my-terraform-state-bucket-00"  # Ganti sesuai nama bucket kamu
    prefix = "terraform/step-10"                       # Folder logis di dalam bucket
  }
}
