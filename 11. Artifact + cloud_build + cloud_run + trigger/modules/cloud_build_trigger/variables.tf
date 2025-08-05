variable "trigger_name" {
  type        = string
  description = "Name of the trigger"
}

variable "github_owner" {
  type        = string
  description = "GitHub repo owner/org"
}

variable "github_repo" {
  type        = string
  description = "GitHub repository name"
}

variable "branch_regex" {
  type        = string
  default     = "^main$"
  description = "Regex pattern for branch"
}

variable "region" {
  type        = string
}

variable "project_id" {
  type        = string
}

variable "repo_name" {
  type        = string
}

variable "service_name" {
  type        = string
}
