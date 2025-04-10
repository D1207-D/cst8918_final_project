# CST8918 Final Project

## Overview
This project implements a Terraform-managed infrastructure on Azure for deploying a Remix Weather Application. The infrastructure includes AKS clusters, managed Redis DB, and uses GitHub Actions for automation.

## Team Members
- [Your Name](https://github.com/D1207-D)
- [Team Member 2](GitHub Profile Link)
- [Team Member 3](GitHub Profile Link)
- [Team Member 4](GitHub Profile Link)

## Project Structure
```
├── .github/
│   └── workflows/          # GitHub Actions workflow definitions
└── infra/                  # Terraform infrastructure code
    ├── backend/            # Azure Storage backend configuration
    ├── network/            # Network infrastructure (VNet, subnets)
    ├── aks/                # AKS cluster configurations
    ├── redis/              # Redis cache configurations
    └── weather_app/        # Weather application deployment
```

## Infrastructure Components
- Azure Kubernetes Service (AKS) clusters for test and production
- Azure Cache for Redis instances
- Virtual Network with dedicated subnets
- Azure Container Registry
- Azure Storage for Terraform state

## Getting Started
1. Clone the repository
2. Install required tools:
   - Terraform
   - Azure CLI
   - kubectl
3. Configure Azure credentials
4. Initialize Terraform

## Development Workflow
1. Create a new branch for your feature
2. Make changes and commit
3. Create a pull request
4. Wait for reviews and CI checks to pass
5. Merge after approval

## Branch Protection Rules
- Requires pull request before merging
- Requires status checks to pass
- Requires branches to be up to date
- No self-review allowed

## Status Checks
- Terraform Format Check
- Terraform Validation
- TFLint Analysis
- Infrastructure Plan Review