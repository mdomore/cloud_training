# Phase 3: Cloud Platforms Deep Dive

## Overview



## Table of Contents

  - [Overview](#overview)
  - [Learning Objectives](#learning-objectives)
  - [Structure](#structure)
  - [Prerequisites](#prerequisites)
  - [Estimated Time](#estimated-time)
  - [Learning Strategy](#learning-strategy)
  - [Service Categories to Cover](#service-categories-to-cover)
  - [AWS](#aws)
  - [Purpose](#purpose)
  - [Topics Covered](#topics-covered)
    - [3. Networking Services](#3-networking-services)
    - [6. Monitoring & Management](#6-monitoring-management)
  - [Learning Resources](#learning-resources)
  - [Practical Exercises](#practical-exercises)
  - [Notes](#notes)
  - [GCP](#gcp)
  - [Purpose](#purpose)
  - [Topics Covered](#topics-covered)
    - [3. Networking Services](#3-networking-services)
    - [6. Monitoring & Management](#6-monitoring-management)
  - [Learning Resources](#learning-resources)
  - [Practical Exercises](#practical-exercises)
  - [Notes](#notes)
  - [Azure](#azure)
  - [Purpose](#purpose)
  - [Topics Covered](#topics-covered)
    - [3. Networking Services](#3-networking-services)
    - [6. Monitoring & Management](#6-monitoring-management)
  - [Learning Resources](#learning-resources)
  - [Practical Exercises](#practical-exercises)
  - [Notes](#notes)

---


Deep dive into the three major cloud providers: AWS, GCP, and Azure. Learn their core services, understand their differences, and build proficiency across all three platforms.

## Learning Objectives

By the end of this phase, you should be able to:
- Understand and use core services of AWS, GCP, and Azure
- Provision resources using Terraform for each platform
- Understand the differences and similarities between providers
- Make informed decisions about which services to use

## Structure

This phase covers three major cloud providers:
- **AWS** - Amazon Web Services
- **GCP** - Google Cloud Platform
- **Azure** - Microsoft Azure

## Prerequisites

- Phase 2: Infrastructure as Code completed
- Terraform knowledge
- Cloud provider accounts (free tiers available)

## Estimated Time

- AWS: 3-4 weeks
- GCP: 3-4 weeks
- Azure: 3-4 weeks

**Total: 9-12 weeks**

## Learning Strategy

1. Learn each platform systematically
2. Compare similar services across platforms
3. Practice with Terraform for each provider
4. Build small projects on each platform
5. Document differences and use cases

## Service Categories to Cover

For each cloud provider, learn:
- **Compute** - Virtual machines, containers, serverless
- **Storage** - Object storage, block storage, file storage
- **Networking** - VPC, load balancing, DNS, CDN
- **Databases** - Managed databases (SQL and NoSQL)
- **Security** - IAM, encryption, compliance
- **Monitoring** - Logging, metrics, alerting

---

**Previous Phase:** [Phase 2: Infrastructure as Code](../02-infrastructure/)  
**Next Phase:** [Phase 4: Multi-Cloud Architecture](../04-multi-cloud-architecture/)



---

## AWS

## Purpose

Master Amazon Web Services (AWS), the largest cloud provider. Learn core services and how to use them effectively.

## Topics Covered

### 1. Compute Services
- **EC2** - Elastic Compute Cloud (virtual machines)
- **ECS** - Elastic Container Service
- **EKS** - Elastic Kubernetes Service
- **Lambda** - Serverless functions
- **Elastic Beanstalk** - Platform as a Service

### 2. Storage Services
- **S3** - Simple Storage Service (object storage)
- **EBS** - Elastic Block Store (block storage)
- **EFS** - Elastic File System (managed NFS)
- **Glacier** - Archive storage

### 3. Networking Services
- **VPC** - Virtual Private Cloud
- **CloudFront** - Content Delivery Network
- **Route53** - DNS service
- **API Gateway** - API management
- **Direct Connect** - Dedicated network connection

### 4. Database Services
- **RDS** - Relational Database Service
- **DynamoDB** - NoSQL database
- **ElastiCache** - In-memory caching
- **Redshift** - Data warehouse

### 5. Security & Identity
- **IAM** - Identity and Access Management
- **Security Groups** - Virtual firewalls
- **WAF** - Web Application Firewall
- **KMS** - Key Management Service
- **Secrets Manager** - Secrets management

### 6. Monitoring & Management
- **CloudWatch** - Monitoring and logging
- **CloudTrail** - API logging
- **Config** - Configuration compliance
- **Systems Manager** - Operations management

## Learning Resources

- AWS official documentation
- AWS Well-Architected Framework
- AWS free tier limits
- Terraform AWS provider documentation

## Practical Exercises

1. Set up AWS account and configure CLI
2. Create a VPC with subnets
3. Launch EC2 instances
4. Set up S3 buckets and configure access
5. Deploy a containerized app on ECS/EKS
6. Configure IAM roles and policies
7. Set up monitoring with CloudWatch
8. Use Terraform to provision AWS resources

## Notes

Document your learnings:
- Service comparisons and use cases
- Terraform configurations
- IAM policies and best practices
- Cost optimization tips
- Common patterns and architectures

---

**Next Section:** GCP

---

## GCP

## Purpose

Master Google Cloud Platform (GCP). Learn Google's cloud services and understand their unique features and strengths.

## Topics Covered

### 1. Compute Services
- **Compute Engine** - Virtual machines
- **GKE** - Google Kubernetes Engine
- **Cloud Run** - Serverless containers
- **Cloud Functions** - Serverless functions
- **App Engine** - Platform as a Service

### 2. Storage Services
- **Cloud Storage** - Object storage
- **Persistent Disk** - Block storage
- **Filestore** - Managed NFS
- **Cloud Storage for Firebase** - Mobile/web storage

### 3. Networking Services
- **VPC** - Virtual Private Cloud
- **Cloud Load Balancing** - Load balancing
- **Cloud DNS** - DNS service
- **Cloud CDN** - Content delivery
- **Cloud Interconnect** - Dedicated connections

### 4. Database Services
- **Cloud SQL** - Managed SQL databases
- **Cloud Spanner** - Globally distributed database
- **Firestore** - NoSQL database
- **Bigtable** - NoSQL wide-column database
- **BigQuery** - Data warehouse

### 5. Security & Identity
- **IAM** - Identity and Access Management
- **Cloud Armor** - DDoS protection and WAF
- **Cloud KMS** - Key management
- **Secret Manager** - Secrets management
- **VPC Service Controls** - Service perimeter

### 6. Monitoring & Management
- **Cloud Monitoring** - Metrics and monitoring
- **Cloud Logging** - Centralized logging
- **Cloud Trace** - Distributed tracing
- **Error Reporting** - Error tracking

## Learning Resources

- GCP official documentation
- Google Cloud Architecture Center
- GCP free tier
- Terraform GCP provider documentation

## Practical Exercises

1. Set up GCP account and configure gcloud CLI
2. Create a VPC with subnets
3. Launch Compute Engine instances
4. Set up Cloud Storage buckets
5. Deploy to GKE
6. Configure IAM roles and service accounts
7. Set up monitoring and logging
8. Use Terraform to provision GCP resources

## Notes

Document your learnings:
- Service comparisons with AWS/Azure
- Terraform configurations
- IAM and service accounts
- Cost optimization
- GCP-specific features and advantages

---

**Next Section:** Azure

---

## Azure

## Purpose

Master Microsoft Azure. Learn Azure services and understand how they integrate with Microsoft's ecosystem.

## Topics Covered

### 1. Compute Services
- **Virtual Machines** - Infrastructure as a Service
- **AKS** - Azure Kubernetes Service
- **Container Instances** - Serverless containers
- **Azure Functions** - Serverless functions
- **App Service** - Platform as a Service

### 2. Storage Services
- **Blob Storage** - Object storage
- **Managed Disks** - Block storage
- **Azure Files** - Managed file shares
- **Archive Storage** - Long-term storage

### 3. Networking Services
- **Virtual Network** - Virtual networks
- **Azure Load Balancer** - Load balancing
- **Azure DNS** - DNS service
- **Azure Front Door** - CDN and WAF
- **ExpressRoute** - Dedicated connections

### 4. Database Services
- **Azure SQL Database** - Managed SQL
- **Cosmos DB** - Globally distributed NoSQL
- **Azure Database for PostgreSQL/MySQL** - Managed databases
- **Azure Cache for Redis** - In-memory caching
- **Synapse Analytics** - Data warehouse

### 5. Security & Identity
- **Azure AD** - Identity and access management
- **Network Security Groups** - Virtual firewalls
- **Azure Key Vault** - Secrets and key management
- **Azure DDoS Protection** - DDoS mitigation
- **Azure Firewall** - Managed firewall

### 6. Monitoring & Management
- **Azure Monitor** - Monitoring and metrics
- **Log Analytics** - Centralized logging
- **Application Insights** - APM
- **Azure Policy** - Governance

## Learning Resources

- Azure official documentation
- Azure Architecture Center
- Azure free account
- Terraform Azure provider documentation

## Practical Exercises

1. Set up Azure account and configure Azure CLI
2. Create a Virtual Network with subnets
3. Launch Virtual Machines
4. Set up Blob Storage
5. Deploy to AKS
6. Configure Azure AD and RBAC
7. Set up monitoring and logging
8. Use Terraform to provision Azure resources

## Notes

Document your learnings:
- Service comparisons with AWS/GCP
- Terraform configurations
- Azure AD and RBAC
- Cost optimization
- Azure-specific features and integrations

---

---