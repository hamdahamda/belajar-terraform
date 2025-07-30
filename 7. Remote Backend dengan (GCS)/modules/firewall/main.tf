resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh"
  network = var.vpc_name
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  direction     = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["web", "db"]
}

resource "google_compute_firewall" "allow_http" {
  name    = "allow-http"
  network = var.vpc_name
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  direction     = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["web", "db"]
}
