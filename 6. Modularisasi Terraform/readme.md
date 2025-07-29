# ☁️ Terraform GCP - Modular Infrastructure (Step 6)

Pada step ini, struktur Terraform sudah diubah menjadi **modular** dan scalable.  
Project ini membuat:

✅ 1 Custom VPC  
✅ 1 Subnet  
✅ Firewall rules (SSH & HTTP)  
✅ 2 VM: web & db (dengan spesifikasi berbeda)  
✅ Nginx otomatis terinstall di web-server (via `startup.sh`)  

---

## 📁 Struktur Folder

step-6-modularized-terraform/
├── main.tf
├── variables.tf
├── terraform.tfvars
├── output.tf
├── startup.sh
├── startupdb.sh
├── .gitignore
├── modules/
│ ├── vpc/
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ └── outputs.tf
│ ├── firewall/
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ └── outputs.tf
│ └── vm/
│ ├── main.tf
│ ├── variables.tf
│ └── outputs.tf


---

## ⚙️ Setup

1. Buat file `terraform.tfvars` di root:

```hcl
project_id       = "your-project-id"
credentials_path = "../credentials.json"
region           = "us-central1"
zone             = "us-central1-a"

Inisialisasi dan apply:

terraform init
terraform apply

🌐 Akses Web Server
http://<web-server-ip>
http://<db-server-ip>

🟢 Harus muncul halaman HTML dari Nginx:
Hello from Terraform Nginx VM!
Hello from Terraform Nginx VM Khusus DataBase!


🔥 Penjelasan Modul

📦 modules/vpc
Membuat custom VPC dan subnet
Input: vpc_name, subnet_name, cidr, region

🔐 modules/firewall
Membuka akses SSH dan HTTP ke VM
Menggunakan tag VM (web, db) sebagai target_tags

💻 modules/vm
Membuat VM instance
Dynamic input: machine_type, image, tags, startup_script


