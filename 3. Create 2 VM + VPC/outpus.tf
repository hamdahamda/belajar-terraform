output "web_server_name" {
  value = google_compute_instance.web_server.name
}

output "web_server_ip" {
  value = google_compute_instance.web_server.network_interface[0].access_config[0].nat_ip
}

output "db_server_name" {
  value = google_compute_instance.db_server.name
}

output "db_server_ip" {
  value = google_compute_instance.db_server.network_interface[0].access_config[0].nat_ip
}
