# Enterprise Azure AKS Platform


                 GitHub
                    │
                    ▼
          ┌──────────────────┐
          │ Terraform CI     │
          │                  │
          │ fmt              │
          │ validate         │
          │ TFLint           │
          │ Trivy            │
          │ Checkov          │
          │ plan             │
          └────────┬─────────┘
                   │
                success
                   │
                   ▼
          ┌──────────────────┐
          │ Terraform CD     │
          │                  │
          │ Azure Login      │
          │ Terraform Init   │
          │ Terraform Plan  │
          │ Terraform Apply │
          └────────┬─────────┘
                   │
                   ▼
                 Azure
                   │
        ┌──────────┼───────────┐
        ▼          ▼           ▼
       AKS       AppGW       PostgreSQL
        │
       ACR
        │
    Key Vault


## Phase 0
- [x] Azure Subscription
- [x] Azure DevOps
- [x] Git Repository
- [x] Service Connection

## Phase 1
- [x] Bootstrap
- [x] Remote Backend
- [x] Resource Group Module

## Phase 2
- [x] Network
- [x] Log Analytics
- [x] ACR
- [x] AKS

## Phase 3
- [x] Key Vault
- [x] PostgreSQL
- [x] Managed Identity
- [x] AGIC

## Phase 4
- [x] Dockerize StreamFlix
- [x] Dockerize ToDo Frontend
- [x] Dockerize Python Backend

## Phase 5
- [x] CI Pipeline
- [ ] SonarQube
- [ ] Docker Push

## Phase 6
- [ ] Kubernetes Deployment
- [ ] Services
- [ ] Ingress
- [ ] Secrets
- [ ] ConfigMaps
- [ ] HPA

## Phase 7
- [ ] Monitoring
- [ ] Alerts
- [ ] Azure Monitor

## Phase 8
- [ ] Helm
- [ ] Blue/Green Deployment
- [ ] Production Hardening