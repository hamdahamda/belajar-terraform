variable "project_id" {}
variable "region" {}
variable "image_name" {}
variable "service_name" {}
# variable "github_owner" {}
# variable "github_repo" {}
variable "google_credentials_json" {
  type        = string
  sensitive   = true
}

variable "github_owner" {
  default = "hamdahamda"
}

variable "github_repo" {
  default = "latihan-css-web"
}
