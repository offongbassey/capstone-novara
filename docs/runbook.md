# Novara TaskApp — Runbook

## Deploy the Cluster
```bash
export KOPS_STATE_STORE=s3://novara-kops-state-150502622892
kops update cluster --name cluster.novaradevops.click --yes --admin
kops validate cluster --wait 15m
```

## Deploy the Application
```bash
kubectl apply -f k8s/base/postgres-secret.yaml
kubectl apply -f k8s/base/postgres.yaml
kubectl apply -f k8s/base/backend.yaml
kubectl apply -f k8s/base/frontend.yaml
kubectl apply -f k8s/base/clusterissuer.yaml
kubectl apply -f k8s/base/ingress.yaml
```

## Scale the Application
```bash
kubectl scale deployment frontend --replicas=3
kubectl scale deployment backend --replicas=3
```

## Rolling Update
```bash
kubectl set image deployment/frontend frontend=kinqzbitz/taskapp-frontend:v3
kubectl rollout status deployment/frontend
```

## Troubleshooting
```bash
kubectl get pods -n default
kubectl logs <pod-name>
kubectl describe pod <pod-name>
```

## Destroy Everything
```bash
kops delete cluster --name cluster.novaradevops.click --yes
cd terraform/environments/prod && terraform destroy
```
