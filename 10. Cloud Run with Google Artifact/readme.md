# ☁️ Deploy Cloud Run with Google Artifact Registry using Terraform

Proyek ini menggunakan **Terraform** untuk melakukan provisioning:
- **Artifact Registry** (Docker repo)
- **Cloud Run** service
- Deploy image dari Artifact Registry ke Cloud Run

---

## 📁 Struktur Direktori

```hcl
terraform/
├── main.tf # Memanggil module utama
├── variables.tf # Variabel global
├── output.tf # Output resource penting
├── terraform.tfvars # Nilai variable
├── terraform.tfvars.example
├── backend.tf # Remote state config (GCS)
│
├── modules/
│ ├── artifact_registry/
│ │ ├── main.tf
│ │ └── variables.tf
│ │
│ └── cloud_run_service/
│ ├── main.tf
│ └── variables.tf
│
└── terraform.lock.hcl
```


---

## 🚀 Fungsi
```hcl

| Modul | Deskripsi |
|-------|-----------|
| `artifact_registry` | Membuat Docker repository untuk menyimpan image |
| `cloud_run_service` | Deploy Cloud Run menggunakan image dari Artifact Registry |
```
---

## 🧾 Prasyarat

- Project GCP aktif
- Service Account Terraform sudah diberi role:
  - Artifact Registry Admin
  - Cloud Run Admin
  - Service Account User
- Enable API:
  - Artifact Registry API
  - Cloud Run API

---

## 🛠️ Cara Pakai

### 1. Edit `terraform.tfvars`
```hcl
project_id = "your-gcp-project-id"
region     = "us-central1"
service_name = "my-cloud-run-service"
docker_repo_name = "my-artifact-repo"
image_tag = "latest"
