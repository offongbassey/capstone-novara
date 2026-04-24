# Novara Capstone Project — TaskApp on AWS Kubernetes

## Live Application
- **Frontend**: https://taskapp.novaradevops.click
- **API**: https://api.novaradevops.click

## What I Built
A production-grade cloud infrastructure on AWS hosting a three-tier task management application:
- **React Frontend** — served via NGINX
- **Flask Backend** — REST API
- **PostgreSQL** — persistent database

## Infrastructure Stack
| Tool | Purpose |
|------|---------|
| Terraform | Infrastructure as Code (VPC, S3, DynamoDB, Route53) |
| Kops | Kubernetes cluster management on AWS |
| Kubernetes | Container orchestration |
| Helm | Package manager (NGINX Ingress, cert-manager) |
| Docker | Container images |
| Let's Encrypt | SSL certificates via cert-manager |
| Route53 | DNS management |

## Cluster Details
- 3 Control Plane nodes across us-east-1a, 1b, 1c
- 3 Worker nodes across us-east-1a, 1b, 1c
- Private topology (no public IPs on nodes)
- Calico CNI networking

## Repository Structure
- terraform/ - AWS infrastructure as code
- k8s/base/ - Kubernetes manifests
- taskapp_frontend/ - React app + Dockerfile
- taskapp_backend/ - Flask app + Dockerfile
- docs/ - Architecture, runbook, cost analysis

## Documentation
- [Architecture](docs/architecture.md)
- [Runbook](docs/runbook.md)
- [Cost Analysis](docs/cost-analysis.md)
