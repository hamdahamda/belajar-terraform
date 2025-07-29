# 🚀 Terraform GCP - Create 1 VM

Project sederhana untuk membuat 1 VM instance di GCP menggunakan Terraform.

## 📁 Struktur

```hcl

- `main.tf` – definisi resource (VM instance)
- `variables.tf` – deklarasi variable
- `.terraform.lock.hcl` – lock provider version

```

## 🔧 Prasyarat

- GCP account & service account key (credentials.json)
- Sudah install Terraform CLI & gcloud SDK

## 🚀 Cara Deploy

```bash
terraform init
terraform plan
terraform apply
```