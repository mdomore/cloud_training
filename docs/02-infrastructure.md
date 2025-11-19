# Phase 2: Infrastructure as Code (IaC)

## Overview



## Table of Contents

  - [Overview](#overview)
  - [Learning Objectives](#learning-objectives)
  - [Structure](#structure)
  - [Prerequisites](#prerequisites)
  - [Estimated Time](#estimated-time)
  - [How to Use This Phase](#how-to-use-this-phase)
  - [Configuration Management](#configuration-management)
  - [Purpose](#purpose)
  - [Topics Covered](#topics-covered)
    - [1. Ansible Fundamentals](#1-ansible-fundamentals)
  - [Learning Resources](#learning-resources)
  - [Practical Exercises](#practical-exercises)
  - [Notes](#notes)
  - [Infrastructure Provisioning](#infrastructure-provisioning)
  - [Purpose](#purpose)
  - [Topics Covered](#topics-covered)
    - [1. Terraform Fundamentals](#1-terraform-fundamentals)
    - [4. Multi-Cloud Strategies](#4-multi-cloud-strategies)
  - [Learning Resources](#learning-resources)
  - [Practical Exercises](#practical-exercises)
  - [Notes](#notes)
  - [Containerization](#containerization)
  - [Purpose](#purpose)
  - [Structure](#structure)
  - [Learning Path](#learning-path)
  - [Prerequisites](#prerequisites)
  - [Estimated Time](#estimated-time)
    - [Docker](#docker)
  - [Purpose](#purpose)
  - [Topics Covered](#topics-covered)
    - [1. Docker Fundamentals](#1-docker-fundamentals)
    - [4. Docker Compose](#4-docker-compose)
  - [Learning Resources](#learning-resources)
  - [Practical Exercises](#practical-exercises)
  - [Notes](#notes)
    - [Kubernetes](#kubernetes)
  - [Purpose](#purpose)
  - [Topics Covered](#topics-covered)
    - [1. Kubernetes Fundamentals](#1-kubernetes-fundamentals)
    - [4. Networking](#4-networking)
    - [5. Multi-Cloud Kubernetes](#5-multi-cloud-kubernetes)
  - [Learning Resources](#learning-resources)
  - [Practical Exercises](#practical-exercises)
  - [Notes](#notes)

---


Learn to automate infrastructure provisioning and configuration management. This phase covers the tools and practices that enable reproducible, version-controlled infrastructure.

## Learning Objectives

By the end of this phase, you should be able to:
- Write Ansible playbooks for configuration management
- Provision infrastructure with Terraform across multiple clouds
- Containerize applications with Docker
- Deploy and manage containerized applications with Kubernetes

## Structure

- **[01-configuration-management](./01-configuration-management/)** - Ansible for automated configuration
- **[02-infrastructure-provisioning](./02-infrastructure-provisioning/)** - Terraform/OpenTofu for infrastructure provisioning
- **[03-containerization](./03-containerization/)** - Docker and Kubernetes

## Prerequisites

- Phase 1: Foundations completed
- Understanding of Linux and networking
- Basic scripting knowledge

## Estimated Time

- Configuration Management: 2-3 weeks
- Infrastructure Provisioning: 3-4 weeks
- Containerization: 3-4 weeks

**Total: 8-11 weeks**

## How to Use This Phase

1. Start with configuration management (Ansible)
2. Move to infrastructure provisioning (Terraform)
3. Learn containerization (Docker, then Kubernetes)
4. Practice combining all tools together
5. Document your infrastructure code and patterns

---

**Previous Phase:** [Phase 1: Foundations](../01-foundations/)  
**Next Phase:** [Phase 3: Cloud Platforms](../03-cloud-platforms/)



---

## Configuration Management

## Purpose

Learn Ansible for automated configuration management, application deployment, and infrastructure orchestration.

## Topics Covered

### 1. Ansible Fundamentals
- What is Ansible and why use it
- Ansible architecture (control node, managed nodes)
- Installation and setup
- Inventory management

### 2. Playbooks
- Playbook structure
- Tasks, handlers, and roles
- Variables and templates (Jinja2)
- Conditionals and loops

### 3. Advanced Concepts
- Roles and role dependencies
- Ansible Vault for secrets
- Dynamic inventories
- Best practices

### 4. Cloud Integration
- Ansible cloud modules (AWS, GCP, Azure)
- Using Ansible with Terraform
- Multi-cloud configuration management

## Learning Resources

- Ansible official documentation
- Ansible Galaxy for roles
- Best practices guides

## Practical Exercises

1. Install and configure Ansible
2. Write your first playbook
3. Create reusable roles
4. Manage secrets with Ansible Vault
5. Configure cloud resources with Ansible

## Notes

Document your learnings:
- Playbook examples
- Role structures
- Common patterns
- Troubleshooting tips
- Integration examples

---

## Infrastructure Provisioning

## Purpose

Learn to provision and manage cloud infrastructure using Infrastructure as Code (IaC) principles with Terraform or OpenTofu.

## Topics Covered

### 1. Terraform Fundamentals
- What is Infrastructure as Code
- Terraform vs OpenTofu
- Installation and setup
- Basic syntax (HCL)

### 2. Core Concepts
- Providers (AWS, GCP, Azure)
- Resources and data sources
- Variables, outputs, locals
- State management

### 3. Advanced Features
- Modules and module composition
- Workspaces and environments
- Remote state backends
- State locking

### 4. Multi-Cloud Strategies
- Provider configuration
- Cross-cloud resource management
- Multi-cloud patterns
- State management across clouds

## Learning Resources

- Terraform documentation
- Provider documentation (AWS, GCP, Azure)
- Terraform best practices

## Practical Exercises

1. Install Terraform/OpenTofu
2. Provision your first resource (e.g., S3 bucket)
3. Create reusable modules
4. Manage multiple environments
5. Provision infrastructure across multiple clouds

## Notes

Document your learnings:
- Terraform configuration examples
- Module structures
- Multi-cloud patterns
- State management strategies
- Common pitfalls and solutions

---

## Containerization

## Purpose

Learn containerization technologies: Docker for building and running containers, and Kubernetes for orchestrating containerized applications at scale.

## Structure

- **[docker](./docker/)** - Container fundamentals with Docker
- **[kubernetes](./kubernetes/)** - Container orchestration with Kubernetes

## Learning Path

1. Start with Docker to understand containers
2. Learn Docker Compose for multi-container applications
3. Move to Kubernetes for production orchestration
4. Understand multi-cloud Kubernetes strategies

## Prerequisites

- Linux system administration knowledge
- Understanding of networking basics
- Basic command-line proficiency

## Estimated Time

- Docker: 2-3 weeks
- Kubernetes: 4-6 weeks

**Total: 6-9 weeks**

---

**Next:** Start with [Docker](./docker/)

---

### Docker

## Purpose

Learn Docker for containerizing applications. Understand how containers work, how to build images, and manage containerized applications.

## Topics Covered

### 1. Docker Fundamentals
- What are containers and why use them
- Docker architecture
- Images vs containers
- Docker installation

### 2. Working with Containers
- Running containers
- Container lifecycle
- Container networking
- Container volumes and data persistence

### 3. Building Images
- Dockerfile syntax
- Best practices for Dockerfiles
- Multi-stage builds
- Image optimization

### 4. Docker Compose
- Compose file syntax
- Multi-container applications
- Networking in Compose
- Environment variables

### 5. Image Management
- Image registries (Docker Hub, private registries)
- Image tagging and versioning
- Image scanning and security

## Learning Resources

- Docker official documentation
- Docker best practices
- Container security guides

## Practical Exercises

1. Install Docker
2. Run your first container
3. Build a custom image with Dockerfile
4. Create a multi-container application with Docker Compose
5. Push images to a registry
6. Optimize image size and security

## Notes

Document your learnings:
- Dockerfile examples
- Docker Compose configurations
- Common patterns
- Troubleshooting tips
- Security best practices

---

**Next:** [Kubernetes](../kubernetes/)

---

### Kubernetes

## Purpose

Learn Kubernetes for orchestrating containerized applications at scale. Understand how to deploy, manage, and scale applications in a Kubernetes cluster.

## Topics Covered

### 1. Kubernetes Fundamentals
- What is Kubernetes and why use it
- Kubernetes architecture (control plane, nodes)
- Core concepts (pods, services, deployments)
- kubectl basics

### 2. Core Resources
- **Pods** - Smallest deployable units
- **Services** - Network abstraction
- **Deployments** - Declarative updates
- **ConfigMaps and Secrets** - Configuration management
- **Namespaces** - Resource isolation

### 3. Advanced Concepts
- **Ingress** - External access
- **PersistentVolumes** - Storage management
- **StatefulSets** - Stateful applications
- **DaemonSets** - Node-level workloads
- **Jobs and CronJobs** - Batch workloads

### 4. Networking
- Pod networking
- Service types (ClusterIP, NodePort, LoadBalancer)
- Ingress controllers
- Network policies

### 5. Multi-Cloud Kubernetes
- Kubernetes on AWS (EKS)
- Kubernetes on GCP (GKE)
- Kubernetes on Azure (AKS)
- Multi-cluster strategies
- Federation concepts

## Learning Resources

- Kubernetes official documentation
- CNCF resources
- Cloud provider Kubernetes guides

## Practical Exercises

1. Set up a local Kubernetes cluster (minikube/kind)
2. Deploy your first application
3. Configure services and ingress
4. Manage configuration with ConfigMaps/Secrets
5. Deploy to cloud-managed Kubernetes (EKS/GKE/AKS)
6. Set up multi-cluster scenarios

## Notes

Document your learnings:
- Kubernetes manifests (YAML examples)
- Deployment patterns
- Multi-cloud strategies
- Troubleshooting guides
- Best practices

---

---