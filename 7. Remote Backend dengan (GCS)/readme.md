📁 7. Remote Backend dengan GCS
Proyek ini menunjukkan bagaimana cara mengonfigurasi remote backend menggunakan Google Cloud Storage (GCS) sebagai tempat penyimpanan file .tfstate.
Dengan remote backend, file state disimpan secara terpusat dan aman, bukan di lokal.

🧠 Tujuan
Mengelola infrastruktur Terraform menggunakan remote backend

Menyimpan file terraform.tfstate di GCS

Mendemokan praktik penyimpanan state yang aman dan kolaboratif

📦 Struktur Proyek
```hcl
7. Remote Backend dengan (GCS)/
├── .gcp/                       # Folder untuk menyimpan credential
│   ├── tf-backend.json         # Service Account khusus backend
├── modules/                    # Modul-modul reusable
├── backend.tf                  # Konfigurasi remote backend
├── main.tf                     # Definisi resource
├── output.tf                   # Output Terraform
├── variables.tf                # Variabel global
├── terraform.tfvars            # Nilai variabel
├── terraform.tfstate           # (tidak digunakan jika pakai remote)
└── terraform.tfstate.backup    # (juga tidak digunakan jika remote)
```
---

🔐 Prasyarat
Sudah menginstall gcloud dan melakukan autentikasi:
```hcl
$env:GOOGLE_APPLICATION_CREDENTIALS="C:\Users\Hamda\.gcp\tf-backend.json"
gcloud auth activate-service-account --key-file=$env:GOOGLE_APPLICATION_CREDENTIALS
```

Pastikan bucket GCS telah dibuat, misalnya:

```hcl
my-terraform-state-bucket-00
```
---
⚙️ Konfigurasi Backend (backend.tf)

```hcl
terraform {
  backend "gcs" {
    bucket  = "my-terraform-state-bucket-00"
    prefix  = "env/dev"
  }
}
```
---
🚀 Jalankan Terraform
```hcl
terraform init     # Menginisialisasi backend ke GCS
terraform plan     # Melihat perubahan
terraform apply    # Menerapkan infrastruktur
```
---
✅ Verifikasi
Setelah apply, file default.tfstate akan tersimpan di:
```hcl
gs://my-terraform-state-bucket-00/env/dev/default.tfstate
```
Bisa dicek melalui Google Cloud Console → Cloud Storage

---
❗ Catatan
File .tfstate tidak akan dihapus secara otomatis saat terraform destroy
Service account untuk backend tidak harus sama dengan SA untuk deploy resource
Jangan lupa tambahkan .gcp/*.json ke .gitignore 

---
🏁 Kesimpulan
Dengan backend GCS:

Kolaborasi jadi lebih aman dan mudah
State tidak hilang saat pindah device
Bisa support multi-environment (dev, staging, prod)

