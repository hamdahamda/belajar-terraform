output "cloud_run_url" {
  value = "https://${module.cloud_run.service_name}-${var.region}.a.run.app"
}
