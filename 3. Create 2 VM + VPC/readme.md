# ☁️ Terraform GCP - 2 VM dengan Custom VPC

Project ini menggunakan Terraform untuk membuat 2 VM di Google Cloud Platform dengan:
- Custom VPC
- Custom Subnet (`10.10.0.0/24`)
- Public IP (dengan akses keluar)
- Tanpa SSH key & firewall (belum ditambahkan)

---

## 📁 Struktur File

```hcl
├── main.tf # VM definition (web & db)
├── network.tf # Custom VPC dan subnet
├── variables.tf # Variabel input
├── terraform.tfvars # Nilai variabel (di-ignore)
├── terraform.tfvars.example # Contoh variabel
├── output.tf # Output IP & nama VM
├── .gitignore # Ignore file sensitif dan sementara
```

---

## 🧰 Prasyarat

- Akun Google Cloud + project aktif
- Service account JSON (`credentials.json`)
- Sudah install:
  - Terraform CLI
  - Google Cloud SDK (`gcloud`)

---

## 🔧 Setup

1. Buat file `terraform.tfvars` atau copy dari contoh:

```hcl
project_id       = "your-gcp-project-id"
credentials_path = "../credentials.json"
region           = "us-central1"
zone             = "us-central1-a"

terraform init
terraform plan
terraform apply

```