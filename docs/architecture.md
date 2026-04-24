# Novara TaskApp — Architecture

## Overview
A production-grade cloud infrastructure on AWS hosting a three-tier TaskApp (React frontend, Flask backend, PostgreSQL database) orchestrated by Kubernetes via Kops.

## AWS Infrastructure
- **VPC**: 10.0.0.0/16 across us-east-1a, us-east-1b, us-east-1c
- **Public Subnets**: 10.0.1-3.0/24 (NAT Gateways, Bastion)
- **Private Subnets**: 10.0.11-13.0/24 (all cluster nodes)
- **NAT Gateways**: 3 (one per AZ for HA)
- **S3**: Terraform state + Kops state storage
- **DynamoDB**: Terraform state locking

## Kubernetes Cluster
- **Tool**: Kops v3.x
- **Version**: Kubernetes 1.29
- **Control Plane**: 3x t3.small (one per AZ)
- **Worker Nodes**: 3x t3.small (one per AZ)
- **Networking**: Calico CNI
- **Topology**: Private (nodes have no public IPs)

## Security
- All worker nodes in private subnets
- Bastion host for SSH access
- TLS via cert-manager + Let's Encrypt
- Kubernetes Secrets for credentials
- No hardcoded credentials in code

## High Availability
- 3 control plane nodes across 3 AZs
- 3 worker nodes across 3 AZs
- 3 NAT Gateways (one per AZ)
- Rolling update strategy (maxUnavailable: 0)
- PostgreSQL PVC backed by EBS (gp2)
