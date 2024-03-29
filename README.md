<h1 align="center">AWS Infrastructure Automation with Terraform 🚀</h1>

<p align="center">
  <img src="images/terraform.png" alt="Project Logo" width="1000"/>
</p>

## 📖 Project Overview

This project showcases the automation of secure, scalable cloud infrastructure on AWS using Terraform:

⌨️ AWS Provider
⌨️ A Subnet
⌨️ An IGW 
⌨️ A Route Table and  Route Table Association
⌨️ A Security Group
⌨️ An AMI Datasource
⌨️ A Key Pair
⌨️ An EC2 Instance
⌨️ Userdata and the File Function
⌨️ SSH Config Scripts
⌨️ The Provisioner and Templatefile
⌨️ Variables
⌨️ Conditional Expressions
⌨️ Outputs

## 🎯 Objectives

- **Automate the Mundane**: Deploy a robust AWS environment with minimal manual intervention.
- **Security at its Core**: A custom VPC and strict Security Groups ensure that our resources remain secure.
- **Scalability in Mind**: Designed for easy scaling, making your infrastructure grow as your needs do.

## 🛠 Technologies Used

- **Terraform**: The spine of our infrastructure automation.
- **AWS**: Our chosen cloud playground, featuring services like EC2, VPC, and more.

## 📐 Architecture Diagram

<p align="center">
  <img src="images/terraform2.png" alt="Architecture Diagram" width="600"/>
</p>

_Interconnected world of AWS resources created and managed by Terraform._

## 🚀 Getting Started

### Prerequisites

Ensure you're equipped with:
- Terraform (`≥ v1.7.0`)
- AWS CLI, all set up and ready to go

### 🌟 Spinning Up the Universe

```bash
# Clone the cosmic repository
git clone https://github.com/ConniceT/InInfracode-AWS-Terraform.git

# Initialize Terraform in the project directory
cd your-repo-name && terraform init

# Plan your deployment strategy
terraform plan

# Deploy your infrastructure to the AWS 
terraform apply
