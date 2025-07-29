# ☁️ Terraform GCP - 2 VM dengan Custom VPC dan Firewall

Project ini menggunakan Terraform untuk membuat infrastruktur GCP yang terdiri dari:

- ✅ 2 VM instance (`web-server` dan `db-server`)
- ✅ 1 VPC custom (`custom-vpc`)
- ✅ 1 Subnet custom (`10.10.0.0/24`)
- ✅ Firewall rules untuk:
  - SSH (`port 22`) ke semua VM
  - HTTP (`port 80`) ke VM `web-server`

---

## 📁 Struktur File

├── main.tf # Resource VM
├── network.tf # VPC dan subnet
├── firewall.tf # Firewall rules (SSH + HTTP)
├── variables.tf # Variabel input
├── terraform.tfvars # Nilai variabel (di-ignore)
├── terraform.tfvars.example # Contoh variabel
├── output.tf # Output IP VM
├── .gitignore # Ignore file sensitif dan auto-gen


---

## 🧰 Prasyarat

- Akun Google Cloud aktif + project
- Sudah aktifkan Compute Engine API
- File service account (credentials.json)
- Sudah install:
  - Terraform CLI
  - Google Cloud SDK (gcloud)

---

## 🔧 Setup

1. Copy file `terraform.tfvars.example` ke `terraform.tfvars`, lalu isi dengan value kamu:

```hcl
project_id       = "your-project-id"
credentials_path = "../credentials.json"
region           = "us-central1"
zone             = "us-central1-a"

terraform init
terraform plan
terraform apply

