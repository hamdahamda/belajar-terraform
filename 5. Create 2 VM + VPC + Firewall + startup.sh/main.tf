provider "google" {
  project     = var.project_id
  region      = var.region
  zone        = var.zone
  credentials = file(var.credentials_path)
}

resource "google_compute_instance" "web_server" {
  name         = "web-server"
  machine_type = "e2-micro"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

network_interface {
  network    = google_compute_network.custom_vpc.id
  subnetwork = google_compute_subnetwork.custom_subnet.name
  access_config {}
}

  tags = ["web"]

   metadata_startup_script = file("startup.sh")
}

resource "google_compute_instance" "db_server" {
  name         = "db-server"
  machine_type = "e2-standard-2"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

network_interface {
  network    = google_compute_network.custom_vpc.id
  subnetwork = google_compute_subnetwork.custom_subnet.name
  access_config {}
}

  tags = ["db"]
}
