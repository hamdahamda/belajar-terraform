# ☁️ Terraform GCP - Create 2 Custom VMs

Project ini menggunakan Terraform untuk membuat **2 VM instance berbeda di Google Cloud Platform**, tanpa SSH key atau custom VPC.

## 🎯 Tujuan

- Deploy 2 VM di GCP
- Gunakan spesifikasi (machine type) dan nama VM yang berbeda
- Pakai default network GCP

## 📁 Struktur File
├── main.tf # Resource VM web + db
├── variables.tf # Variabel input (project_id, zone, dll)
├── terraform.tfvars # Nilai untuk variable (di-ignore)
├── terraform.tfvars.example # Contoh isi variabel
├── output.tf # Menampilkan IP VM
└── .gitignore # Ignore file sensitif dan hasil Terraform


## ⚙️ Prasyarat

- Akun GCP + sudah buat project
- Sudah aktifkan Compute Engine API
- Install:
  - [Terraform](https://developer.hashicorp.com/terraform/downloads)
  - [gcloud CLI](https://cloud.google.com/sdk/docs/install)

## 🔧 Setup

1. Buat file credentials:  
   (di GCP, download service account JSON dan simpan sebagai `credentials.json`)

2. Edit `terraform.tfvars` (atau copy dari `.example`)

```hcl
project_id       = "your-project-id"
credentials_path = "../credentials.json"
region           = "us-central1"
zone             = "us-central1-a"

terraform init
terraform plan
terraform apply

