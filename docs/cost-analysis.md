# Cost Analysis

## Monthly AWS Cost Estimate

| Service | Details | Cost |
|---------|---------|------|
| EC2 (Control Plane) | 3x t3.small | ~$45/mo |
| EC2 (Worker Nodes) | 3x t3.small | ~$45/mo |
| EC2 (Bastion) | 1x t3.micro | ~$8/mo |
| NAT Gateways | 3x NAT GW | ~$100/mo |
| ELB | 1x Classic LB | ~$18/mo |
| S3 | State storage | ~$1/mo |
| DynamoDB | State locking | ~$1/mo |
| Route53 | Hosted zones | ~$2/mo |
| EBS Volumes | 10Gi PostgreSQL | ~$1/mo |
| **Total** | | **~$221/mo** |

## Cost Optimization Applied
- Used t3.small instead of t3.medium (50% savings on compute)
- PAY_PER_REQUEST DynamoDB (no idle cost)
- Destroy cluster when not in use during development
- AWS Credits used: $140.47

## Production Recommendations
- Use Reserved Instances for 1yr (saves ~40%)
- Use Spot Instances for worker nodes (saves ~70%)
- Reduce to 1 NAT Gateway for dev environments
