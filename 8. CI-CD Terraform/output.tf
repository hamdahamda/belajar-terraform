output "web_server_ip" {
  value = module.web_server.public_ip
}

output "db_server_ip" {
  value = module.db_server.public_ip
}
