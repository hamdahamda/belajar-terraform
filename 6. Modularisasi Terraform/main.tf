provider "google" {
  project     = var.project_id
  region      = var.region
  zone        = var.zone
  credentials = file(var.credentials_path)
}

module "vpc" {
  source      = "./modules/vpc"
  vpc_name    = "custom-vpc"
  subnet_name = "custom-subnet"
  subnet_cidr = "10.10.0.0/24"
  region      = var.region
}

module "firewall" {
  source   = "./modules/firewall"
  vpc_name = module.vpc.vpc_id
}

module "web_server" {
  source         = "./modules/vm"
  name           = "web-server"
  machine_type   = "e2-micro"
  zone           = var.zone
  image          = "debian-cloud/debian-12"
  network        = module.vpc.vpc_id
  subnetwork     = module.vpc.subnet_name
  tags           = ["web"]
  startup_script = file("startup.sh")
}

module "db_server" {
  source         = "./modules/vm"
  name           = "db-server"
  machine_type   = "e2-standard-2"
  zone           = var.zone
  image          = "debian-cloud/debian-12"
  network        = module.vpc.vpc_id
  subnetwork     = module.vpc.subnet_name
  tags           = ["db"]
  startup_script = file("startupdb.sh")
}
