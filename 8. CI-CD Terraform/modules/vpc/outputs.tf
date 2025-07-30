output "vpc_id" {
  value = google_compute_network.custom_vpc.id
}

output "subnet_name" {
  value = google_compute_subnetwork.custom_subnet.name
}
