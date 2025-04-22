# 🌐 Portfolio Website Deployment using Terraform & GitHub Actions 🚀

![Terraform](https://img.shields.io/badge/IaC-Terraform-5C4EE5?logo=terraform&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/CI%2FCD-GitHub%20Actions-2088FF?logo=githubactions&logoColor=white)
![AWS](https://img.shields.io/badge/Cloud-AWS-FF9900?logo=amazonaws&logoColor=white)
![HTML/CSS](https://img.shields.io/badge/Frontend-HTML%2FCSS-E34F26?logo=html5&logoColor=white)

## 📦 Overview

This project deploys a static portfolio website to AWS S3 using **Terraform Modules** for infrastructure provisioning and **GitHub Actions** for continuous deployment.

---

## 🛠️ Tech Stack

- **Terraform** – For defining and provisioning AWS infrastructure
- **GitHub Actions** – For automating the deployment pipeline
- **AWS S3** – For static website hosting
- **HTML/CSS** – Portfolio website content

---

## 💡 Why S3?

I chose **Amazon S3** to host the portfolio site because:

- It's **cost-effective** (no server costs)
- It supports **static website hosting**
- Easy integration with **Terraform** and **GitHub Actions**

> 🆚 Other Considered Options:
> - AWS ECS
> - AWS EC2  
> But they were more costly and overkill for a static site.

---

## 📁 Project Structure
├── .github/
│   └── workflows/
│       └── deploy.yml              
├── Portfolio_Website/
│   ├── index.html                  
│   ├── error.html                  
│   └── ...                         
├── Terraform_S3/
│   ├── AWS_S3/
│      └── var.tf                  
│      ├── S3.tf
├── main.tf                     
├── README.md                      

---

## 🚀 Deployment Steps

### 🔧 1. Prerequisites

- AWS account with access key & secret
- [Terraform](https://www.terraform.io/downloads)
- GitHub repository
- Enable GitHub Actions
- Store secrets in GitHub:
  - `AWS_ACCESS_KEY`
  - `AWS_SECRET_ACCESS_KEY`

---

### 📤 2. Add Your Website Files

Place your HTML, CSS, JS files inside `Portfolio_Website/`.

---

### ⚙️ 3. Configure Terraform

Edit `Terraform_S3/variables.tf` with:

```hcl
module "my-portfolio"{
    source = "./AWS_S3"
    region = "Region"
    bucket_name = "Bucket Name"
    host_file = "HTML File"
    error_file = "Error HTML File"
    version_boolean = false
    force_destroy = true
}

