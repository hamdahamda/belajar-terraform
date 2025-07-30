terraform {
  backend "gcs" {
    bucket  = "my-terraform-state-bucket-00"  # Ganti sesuai nama bucket kamu
    prefix  = "env/dev"                        # Folder logis di dalam bucket
  }
}
