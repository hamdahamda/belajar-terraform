# 🚀 Step 9: Deploy Aplikasi ke Cloud Run dari Source Repo (dengan Terraform)

Tutorial ini akan menunjukkan bagaimana cara menggunakan **Terraform** untuk:
- Provision layanan **Cloud Run**
- Deploy image aplikasi dari **Container Registry / Artifact Registry**
- Setup IAM agar Cloud Run bisa diakses publik (tanpa login)
- Gunakan workflow GitHub Actions untuk otomatisasi deploy

---

## 📁 Struktur Folder

```bash
9. Cloud Run from Source Repo/
├── main.tf
├── backend.tf
├── variables.tf
├── terraform.tfvars
├── output.tf
├── modules/
│   └── cloudrun/
│       ├── main.tf
│       └── outputs.tf
│       └── variables.tf
├── terraform.tfstate (by Terraform)
├── README.md ← 📌 (file ini)
```

🛡️ IAM Permissions
Agar Cloud Run bisa diatur oleh service account Terraform, pastikan sudah diberi role:

```bash
| Role                 | Fungsi                                    |
| -------------------- | ----------------------------------------- |
| Cloud Run Admin      | Kelola semua layanan Cloud Run            |
| Service Account User | Jalankan action sebagai service acc       |
| Storage Admin        | Akses Bucket GCS (jika pakai backend GCS) |
```

🌐 Output
Jika ingin generate URL hasil deploy:

```bash
output "cloud_run_url" 
{
  value = "https://${var.service_name}-${var.region}.a.run.app"
}
```