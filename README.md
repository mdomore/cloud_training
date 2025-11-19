# Cloud Training - Hybrid Multi-Cloud Learning Path

## 🎯 Objective

Build and deploy a production-ready application on a **hybrid multicloud infrastructure** across:
- **AWS** (Amazon Web Services)
- **GCP** (Google Cloud Platform)
- **Azure** (Microsoft Azure)

Later, replicate the same architecture using **European cloud alternatives** (OVH, Scaleway, Outscale, etc.)

---

## 📚 Learning Path Overview

### Phase 1: Foundations

#### 1.1 System Administration
- [ ] Linux fundamentals
  - File system, users/groups, permissions
  - Shell scripting (Bash/Zsh)
  - Process management, systemd
  - Network configuration
  - Security hardening (firewall, SSH)

#### 1.2 Networking
- [ ] TCP/IP model
- [ ] DNS, DHCP
- [ ] Load balancing concepts
- [ ] VPN, VPC, subnets
- [ ] Network security (firewalls, security groups)

#### 1.3 Development Basics
- [ ] Version control (Git)
- [ ] Programming language (Python/Go/Node.js)
- [ ] API development (REST)
- [ ] Testing strategies

---

### Phase 2: Infrastructure as Code (IaC)

#### 2.1 Configuration Management
- [ ] **Ansible**
  - Playbooks, roles, inventories
  - Idempotency
  - Templates and variables

#### 2.2 Infrastructure Provisioning
- [ ] **Terraform** / **OpenTofu**
  - Providers (AWS, GCP, Azure)
  - State management
  - Modules and workspaces
  - Multi-cloud strategies

#### 2.3 Containerization
- [ ] **Docker**
  - Images, containers, Dockerfile
  - Docker Compose
  - Image registries

- [ ] **Kubernetes**
  - Pods, Services, Deployments
  - ConfigMaps, Secrets
  - Ingress, Service Mesh
  - Multi-cloud Kubernetes strategies

---

### Phase 3: Cloud Platforms Deep Dive

#### 3.1 AWS Core Services
- [ ] Compute: EC2, ECS, EKS, Lambda
- [ ] Storage: S3, EBS, EFS
- [ ] Networking: VPC, CloudFront, Route53
- [ ] Database: RDS, DynamoDB
- [ ] Security: IAM, Security Groups, WAF
- [ ] Monitoring: CloudWatch

#### 3.2 GCP Core Services
- [ ] Compute: Compute Engine, GKE, Cloud Functions
- [ ] Storage: Cloud Storage, Persistent Disk
- [ ] Networking: VPC, Cloud Load Balancing, Cloud DNS
- [ ] Database: Cloud SQL, Firestore
- [ ] Security: IAM, Cloud Armor
- [ ] Monitoring: Cloud Monitoring, Cloud Logging

#### 3.3 Azure Core Services
- [ ] Compute: Virtual Machines, AKS, Azure Functions
- [ ] Storage: Blob Storage, Managed Disks
- [ ] Networking: Virtual Network, Azure Load Balancer, Azure DNS
- [ ] Database: Azure SQL, Cosmos DB
- [ ] Security: Azure AD, Network Security Groups
- [ ] Monitoring: Azure Monitor, Log Analytics

---

### Phase 4: Multi-Cloud Architecture

#### 4.1 Hybrid Cloud Concepts
- [ ] Cloud connectivity (VPN, Direct Connect, ExpressRoute, Cloud Interconnect)
- [ ] Data synchronization across clouds
- [ ] Disaster recovery strategies
- [ ] Cost optimization across providers

#### 4.2 Multi-Cloud Patterns
- [ ] Active-Active deployments
- [ ] Active-Passive failover
- [ ] Data replication strategies
- [ ] Cross-cloud load balancing
- [ ] Identity federation (SSO, OIDC)

#### 4.3 Networking in Multi-Cloud
- [ ] Inter-cloud connectivity
- [ ] DNS management across clouds
- [ ] Traffic routing and failover
- [ ] Network security policies

---

### Phase 5: CI/CD & Automation

#### 5.1 CI/CD Pipelines
- [ ] **GitLab CI/CD** or **GitHub Actions**
  - Pipeline stages
  - Multi-environment deployments
  - Multi-cloud deployment strategies

#### 5.2 Automation Tools
- [ ] Infrastructure automation
- [ ] Application deployment automation
- [ ] Blue/Green, Canary deployments

---

### Phase 6: Security & Compliance

#### 6.1 Cloud Security
- [ ] Identity and Access Management (IAM)
- [ ] Secrets management (Vault, AWS Secrets Manager, etc.)
- [ ] Network security
- [ ] Data encryption (at rest, in transit)
- [ ] Security scanning (Trivy, Clair)

#### 6.2 Compliance & Governance
- [ ] Policy as Code (OPA, Sentinel)
- [ ] Compliance frameworks (GDPR, SOC2)
- [ ] Audit logging
- [ ] Cost governance

---

### Phase 7: Observability

#### 7.1 Monitoring
- [ ] Metrics collection (Prometheus, CloudWatch, etc.)
- [ ] Alerting strategies
- [ ] Multi-cloud monitoring solutions

#### 7.2 Logging
- [ ] Centralized logging (ELK, Loki, Cloud Logging)
- [ ] Log aggregation across clouds

#### 7.3 Tracing
- [ ] Distributed tracing (Jaeger, Zipkin)
- [ ] Application performance monitoring (APM)

---

### Phase 8: Application Development

#### 8.1 Cloud-Native Application Design
- [ ] Microservices architecture
- [ ] 12-factor app principles
- [ ] Stateless design
- [ ] API design and versioning

#### 8.2 Application Deployment
- [ ] Container orchestration
- [ ] Service mesh (Istio, Linkerd)
- [ ] API gateways

---

### Phase 9: European Cloud Alternatives

#### 9.1 European Cloud Providers
- [ ] **OVHcloud**
  - Services overview
  - Terraform provider
  - Integration patterns

- [ ] **Scaleway**
  - Services overview
  - Terraform provider
  - Integration patterns

- [ ] **Outscale**
  - Services overview
  - Terraform provider
  - Integration patterns

#### 9.2 Multi-Cloud with European Providers
- [ ] Replicate architecture on European clouds
- [ ] Hybrid scenarios (US clouds + European clouds)
- [ ] Data sovereignty considerations
- [ ] Compliance (GDPR, localization)

---

## 🏗️ Project Structure

This repository is organized into 9 phases, each with detailed subdirectories and README files explaining what to learn:

```
cloud_training/
├── README.md (this file)
│
├── 01-foundations/
│   ├── README.md
│   ├── 01-system-administration/
│   ├── 02-networking/
│   └── 03-development-basics/
│
├── 02-infrastructure/
│   ├── README.md
│   ├── 01-configuration-management/ (Ansible)
│   ├── 02-infrastructure-provisioning/ (Terraform)
│   └── 03-containerization/
│       ├── docker/
│       └── kubernetes/
│
├── 03-cloud-platforms/
│   ├── README.md
│   ├── 01-aws/
│   ├── 02-gcp/
│   └── 03-azure/
│
├── 04-multi-cloud-architecture/
│   ├── README.md
│   ├── 01-hybrid-cloud-concepts/
│   ├── 02-multi-cloud-patterns/
│   └── 03-networking/
│
├── 05-ci-cd-automation/
│   ├── README.md
│   ├── 01-pipelines/
│   └── 02-automation-tools/
│
├── 06-security-compliance/
│   ├── README.md
│   ├── 01-cloud-security/
│   └── 02-compliance-governance/
│
├── 07-observability/
│   ├── README.md
│   ├── 01-monitoring/
│   ├── 02-logging/
│   └── 03-tracing/
│
├── 08-application-development/
│   ├── README.md
│   ├── 01-cloud-native-design/
│   └── 02-deployment/
│
└── 09-european-cloud-alternatives/
    ├── README.md
    ├── 01-providers/
    └── 02-multi-cloud-european/
```

Each directory contains a README.md file with:
- **Purpose**: What you'll learn
- **Topics Covered**: Detailed breakdown
- **Learning Resources**: Where to find information
- **Practical Exercises**: Hands-on activities
- **Notes**: Space to document your learnings

---

## 📖 Learning Resources

### Inspiration Sources
- [Stéphane Robert - DevSecOps Training](https://blog.stephane-robert.info/docs/)
- [Xavki - GitLab Training](https://gitlab.com/xavki/gitlabV2/-/tree/master)

### Additional Resources
- Cloud provider official documentation
- Terraform documentation
- Kubernetes documentation
- CNCF landscape

---

## 🎓 Progress Tracking

- [ ] Phase 1: Foundations
- [ ] Phase 2: Infrastructure as Code
- [ ] Phase 3: Cloud Platforms Deep Dive
- [ ] Phase 4: Multi-Cloud Architecture
- [ ] Phase 5: CI/CD & Automation
- [ ] Phase 6: Security & Compliance
- [ ] Phase 7: Observability
- [ ] Phase 8: Application Development
- [ ] Phase 9: European Cloud Alternatives

---

## 🚀 Getting Started

### For Beginners
1. Start with **[Phase 1: Foundations](./01-foundations/)** - Build your base knowledge
2. Read each phase's README to understand the learning path
3. Complete practical exercises in each section
4. Document your learnings in the Notes sections

### For Experienced Professionals
1. Review each phase's README to identify knowledge gaps
2. Focus on phases where you need clarification
3. Use this as a reference and documentation structure
4. Contribute improvements and additional resources

### Setup Requirements
1. **Local Development Environment**
   - Linux system (or WSL2 on Windows)
   - Git installed
   - Text editor or IDE

2. **Cloud Accounts** (create as you progress)
   - AWS account (free tier)
   - GCP account (free tier)
   - Azure account (free tier)
   - European cloud accounts (OVH, Scaleway, Outscale)

3. **Tools** (install as needed per phase)
   - Terraform/OpenTofu
   - Ansible
   - Docker
   - kubectl
   - Cloud provider CLIs

### How to Use This Repository

1. **Navigate to a Phase**: Start with `01-foundations/README.md`
2. **Read the Phase Overview**: Understand what you'll learn
3. **Explore Subdirectories**: Each has detailed README files
4. **Complete Exercises**: Practice what you learn
5. **Document Progress**: Add notes, code examples, and learnings
6. **Track Your Progress**: Use the checkboxes in each README

---

## 📝 How to Contribute

This is a personal learning repository that will be shared. As you progress:

1. **Document Your Learnings**: Add notes, examples, and insights in each directory
2. **Share Code Examples**: Include working code and configurations
3. **Update READMEs**: Improve explanations based on your experience
4. **Add Resources**: Share useful learning materials you discover
5. **Fix Errors**: Correct any mistakes you find

## 🎯 Learning Philosophy

This path is designed to be:
- **Progressive**: Build knowledge step by step
- **Practical**: Hands-on exercises in each section
- **Comprehensive**: Cover all aspects of hybrid multi-cloud
- **Didactic**: Clear explanations for sharing knowledge
- **Flexible**: Adapt to your existing knowledge level

## 📝 Notes

This learning path is a living document. Update it as you progress and discover new requirements or technologies.

**Last updated:** 2025-01-27

