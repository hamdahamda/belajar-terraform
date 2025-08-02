output "debug_trigger" {
  value = {
    trigger_name   = var.trigger_name
    github_owner   = var.github_owner
    github_repo    = var.github_repo
    github_branch  = var.github_branch
    image_url      = var.image_url
    service_name   = var.service_name
    region         = var.region
  }
}
