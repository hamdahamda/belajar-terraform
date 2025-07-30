# 🧱 Step 8 – Terraform CI/CD via GitHub Actions

Langkah ini merupakan tahap lanjutan dari setup infrastruktur GCP menggunakan Terraform, di mana kita menambahkan **Continuous Integration & Deployment (CI/CD)** menggunakan **GitHub Actions**.

> Tujuan utama: Otomatisasi `terraform init`, `validate`, `plan`, dan `apply` saat push ke branch `main`.

---

## 🚀 Fitur CI/CD yang Diimplementasikan

✅ Remote Backend di GCS  
✅ GitHub Actions Workflow untuk:
- `terraform init`
- `terraform validate`
- `terraform plan -out=tfplan.out`
- `terraform apply -auto-approve tfplan.out` *(branch: main)*  
✅ Credential aman via GitHub Secrets  
✅ Modular Terraform dengan resource: VPC, Firewall, 2 VM  
✅ Output: Public IP Web Server & DB Server

---

## 📂 Struktur Folder

```hcl
CI-CD Terraform/
├── backend.tf
├── main.tf
├── output.tf
├── variables.tf
├── terraform.tfvars
├── modules/
│ ├── vpc/
│ ├── firewall/
│ └── vm/
├── startup.sh
├── startupdb.sh
└── README.md
```


---

## 🔐 Secrets GitHub yang Dibutuhkan
```hcl
| Secret Name            | Deskripsi                                   |
|------------------------|---------------------------------------------|
| `GCP_CREDENTIALS`      | Isi file `credentials.json` dari GCP SA     |

> Secrets ini di-inject sebagai variable Terraform menggunakan `TF_VAR_google_credentials_json`
```
---

## 🔧 CI/CD Trigger

```yaml
on:
  push:
    branches:
      - main
  pull_request:
```
---
```hcl
🧪 Hasil Apply
Terraform berhasil membuat resource berikut:

✅ VPC: custom-vpc
✅ Subnet: custom-subnet
✅ Firewall: allow SSH & HTTP
✅ 2 VM: web-server & db-server
✅ Output IP:

Web Server: 34.xxx.xxx.xxx
DB Server: 34.xxx.xxx.xxx
```
---
📌 Kesimpulan Step 8
🔥 Step 8 membuktikan bahwa:

Infrastructure-as-Code (IaC) bisa sepenuhnya diotomatisasi
Kita bisa deploy VM dan resource GCP hanya dengan push ke GitHub
Menggunakan TF_VAR_ adalah best practice untuk pass secrets ke Terraform
Struktur modular + backend remote + pipeline = 🚀 production-ready Terraform stack

---


📥 Cara Menambahkan GitHub Secret GCP_CREDENTIALS

---

## 🔐 Cara Menambahkan GitHub Secret `GCP_CREDENTIALS`

Untuk menjalankan workflow CI/CD ini, kamu harus menyediakan credentials dari GCP dalam bentuk secret.
```hcl
### 🔽 Langkah-langkah:

1. **Buat Service Account di GCP**
   - Masuk ke: `IAM & Admin > Service Accounts`
   - Buat atau pilih service account
   - Beri role minimal: `Editor` (atau `Compute Admin`, `Storage Admin` sesuai resource)
   - Klik "Manage Keys" → Add Key → JSON

2. **Download file `credentials.json`**

3. **Buka GitHub Repository kamu**
   - Masuk ke: `Settings > Secrets and variables > Actions`

4. **Klik "New repository secret"**

   - **Name:** `GCP_CREDENTIALS`
   - **Value:** Paste isi lengkap file `credentials.json`

   Contoh isi:
   ```json
   {
     "type": "service_account",
     "project_id": "your-project-id",
     "private_key_id": "...",
     "private_key": "-----BEGIN PRIVATE KEY-----\\n...",
     ...
   }
5.  Klik Add secret
```

```hcl
env:
  GOOGLE_CREDENTIALS: ${{ secrets.GCP_CREDENTIALS }}
  TF_VAR_google_credentials_json: ${{ secrets.GCP_CREDENTIALS }}
```
---
GitHub Actions akan otomatis inject secret ini ke Terraform via environment:

```hcl
env:
  TF_VAR_google_credentials_json: ${{ secrets.GCP_CREDENTIALS }}
```
---
Sehingga kamu bisa menggunakannya dalam provider "google":
```hcl
provider "google" {
  credentials = var.google_credentials_json
  project     = var.project_id
  region      = var.region
}
```