output "allow_ssh_name" {
  value = google_compute_firewall.allow_ssh.name
}

output "allow_http_name" {
  value = google_compute_firewall.allow_http.name
}
