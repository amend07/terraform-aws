# Terraform AWS EC2 Instance Setup

This Terraform configuration creates an EC2 instance on AWS with a root volume of 30 GB and sets up necessary 
security groups and key pairs for SSH access. The instance is tagged as "ubuntu-server" and runs `apt update` and `apt upgrade` 
commands during initialization.

## Prerequisites

Before you begin, ensure you have the following installed:

- [Terraform](https://www.terraform.io/downloads.html) (version 0.12 or later)
- [AWS CLI](https://aws.amazon.com/cli/) configured with your credentials
- [Visual Studio Code (VS Code)](https://code.visualstudio.com/)
- [Terraform VS Code Extension](https://marketplace.visualstudio.com/items?itemName=HashiCorp.terraform)

## Setup

1. **Clone the Repository**

   `git clone (https://github.com/amend07/terraform-aws/)`
   
   `cd terraform-aws`

3. **Configure AWS Credentials**
   Ensure your AWS CLI is configured with the necessary credentials:
   
   `aws configure`
5. **Initialize terraform**
   Open the project directory in VS Code and run the following command in the integrated terminal to initialize Terraform:
   
   `terraform init`
7. **Plan the Infrastructure**
   To see the changes that will be made by this configuration, run:
   
   `terraform plan`
9. **Apply the Configuration**
   To create the EC2 instance and related resources, run:
   
   `terraform apply`


