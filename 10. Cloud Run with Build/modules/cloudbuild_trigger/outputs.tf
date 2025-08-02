output "cloudbuild_trigger_config" {
  value = {
    owner   = var.github_owner
    repo    = var.github_repo
    branch  = var.github_branch
  }
}
