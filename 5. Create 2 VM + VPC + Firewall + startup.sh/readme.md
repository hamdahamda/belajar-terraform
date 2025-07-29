# ☁️ Terraform GCP - 2 VM + VPC + Firewall + Nginx (Step 5)

Project ini menggunakan Terraform untuk deploy:

- 2 VM (`web-server`, `db-server`)
- 1 Custom VPC + Subnet
- Firewall Rules (SSH & HTTP)
- Otomatis install **Nginx** di `web-server` saat VM dibuat

---

## 📁 Struktur File

```hcl
├── main.tf # Resource VM (dengan startup script)
├── network.tf # VPC dan subnet
├── firewall.tf # Firewall rules (SSH + HTTP)
├── variables.tf # Variabel input
├── terraform.tfvars # Isi value var (di-ignore)
├── terraform.tfvars.example # Contoh variabel
├── output.tf # Output IP VM
├── startup.sh # 🆕 Script untuk install nginx
└── .gitignore
```
---

🖥️ Startup Script (startup.sh)
```hcl
#!/bin/bash
apt update -y
apt install nginx -y
systemctl start nginx
systemctl enable nginx
echo "<h1>Hello from Terraform Nginx VM!</h1>" > /var/www/html/index.html
```

🔥 Firewall Rules
allow-ssh: buka port 22 untuk VM dengan tag web dan db
allow-http: buka port 80 untuk VM dengan tag web

🌍 Akses Web Server
http://<web-server-ip>

🟢 Harus muncul:
Hello from Terraform Nginx VM!

