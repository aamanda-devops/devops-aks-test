# DevOps Teste Técnico – AKS Deployment

## Visão Geral

Este repositório contém a implementação de uma solução completa de infraestrutura e deploy de aplicação utilizando práticas de DevOps e Cloud Native, com provisionamento via Terraform e execução em Azure Kubernetes Service (AKS).

A aplicação consiste em uma API ASP.NET Core, containerizada com Docker e publicada em um cluster Kubernetes, com exposição pública via Ingress.

---

## Arquitetura

A solução foi construída com os seguintes componentes:

- Azure Resource Group
- Azure Virtual Network e Subnet dedicada ao AKS
- Azure Kubernetes Service (AKS) gerenciado
- Azure Container Registry (ACR)
- Kubernetes (Deployments, Services e Ingress)
- Exposição pública via Load Balancer / Ingress Controller

---

## Tecnologias Utilizadas

- Azure Kubernetes Service (AKS)
- Azure Container Registry (ACR)
- Terraform (Infrastructure as Code)
- Kubernetes
- Docker
- ASP.NET Core (.NET 8)
- NGINX Ingress Controller

---

## Deploy da Infraestrutura

1. Provisionamento via Terraform
cd infra/envs/dev
terraform init
terraform apply -auto-approve

2. Configuração do acesso ao cluster
az aks get-credentials -g rg-devops -n aks-devops-test
kubectl get nodes
Build e Publicação da Aplicação
Build da imagem Docker
docker build -t acrdevopsamanda123.azurecr.io/myapp:v1 .
Push para o ACR
docker push acrdevopsamanda123.azurecr.io/myapp:v1
Deploy no Kubernetes
kubectl apply -f k8s/
Validação
kubectl get pods
kubectl get svc
kubectl get ingress
Acesso à Aplicação

---

## A aplicação é exposta publicamente via Ingress:
http://20.12.153.144

---

## Decisões Técnicas
Uso de AKS gerenciado para reduzir complexidade operacional
Integração com Azure Container Registry para controle de imagens
Separação entre infraestrutura (Terraform) e runtime (Kubernetes)
Uso de Ingress Controller para exposição HTTP padronizada
Aplicação de liveness/readiness probes para confiabilidade
Definição de requests e limits para controle de recursos

---

## Problemas Encontrados e Soluções
1. Falha no pull de imagem (ImagePullBackOff)
Causa: permissões ausentes no ACR
Solução: atribuição da role AcrPull ao Managed Identity do AKS
2. Falha de health check no Kubernetes
Causa: mismatch entre porta da aplicação e configuração do Kubernetes
Solução: ajuste de containerPort e probes para a porta correta

---

## Considerações Finais
Esta implementação cobre o fluxo completo de uma aplicação cloud-native:

Provisionamento de infraestrutura como código
Build e publicação de imagem container
Deploy em cluster Kubernetes gerenciado
Exposição pública via Ingress
Resolução de incidentes comuns em ambientes Kubernetes
