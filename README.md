# Cloud Training - Hybrid Multi-Cloud Learning Path

## 🎯 Objective

Build and deploy a production-ready application on a **hybrid multicloud infrastructure** across:
- **AWS** (Amazon Web Services)
- **GCP** (Google Cloud Platform)
- **Azure** (Microsoft Azure)

Later, replicate the same architecture using:
- **European cloud alternatives** (OVH, Scaleway, Outscale, etc.)
- **On-premise cloud infrastructure** (OpenStack, Proxmox, etc.) using open source tools

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
- [ ] **Ansible** (Open Source)
  - Playbooks, roles, inventories
  - Idempotency
  - Templates and variables

#### 2.2 Infrastructure Provisioning
- [ ] **Terraform** / **OpenTofu** (Open Source)
  - Providers (AWS, GCP, Azure, OpenStack, Proxmox)
  - State management
  - Modules and workspaces
  - Multi-cloud strategies

#### 2.3 Containerization
- [ ] **Docker** (Open Source)
  - Images, containers, Dockerfile
  - Docker Compose
  - Image registries

- [ ] **Kubernetes** (Open Source)
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
- [ ] **GitLab CI/CD** (Open Source) or **GitHub Actions**
  - Pipeline stages
  - Multi-environment deployments
  - Multi-cloud deployment strategies
- [ ] **Jenkins** (Open Source) - Alternative CI/CD platform
- [ ] **Tekton** (Open Source) - Kubernetes-native CI/CD

#### 5.2 Automation Tools
- [ ] Infrastructure automation
- [ ] Application deployment automation
- [ ] Blue/Green, Canary deployments

---

### Phase 6: Security & Compliance

#### 6.1 Cloud Security
- [ ] Identity and Access Management (IAM)
- [ ] Secrets management (HashiCorp Vault - Open Source, AWS Secrets Manager, etc.)
- [ ] Network security
- [ ] Data encryption (at rest, in transit)
- [ ] Security scanning (Trivy - Open Source, Clair - Open Source)

#### 6.2 Compliance & Governance
- [ ] Policy as Code (OPA, Sentinel)
- [ ] Compliance frameworks (GDPR, SOC2)
- [ ] Audit logging
- [ ] Cost governance

---

### Phase 7: Observability

#### 7.1 Monitoring
- [ ] Metrics collection (Prometheus - Open Source, CloudWatch, etc.)
- [ ] Alerting strategies
- [ ] Multi-cloud monitoring solutions

#### 7.2 Logging
- [ ] Centralized logging (ELK Stack - Open Source, Loki - Open Source, Cloud Logging)
- [ ] Log aggregation across clouds

#### 7.3 Tracing
- [ ] Distributed tracing (Jaeger - Open Source, Zipkin - Open Source, Tempo)
- [ ] Application performance monitoring (APM)

---

### Phase 8: Application Development

#### 8.1 Cloud-Native Application Design
- [ ] Microservices architecture
- [ ] 12-factor app principles
- [ ] Stateless design
- [ ] API design and versioning

#### 8.2 Application Deployment
- [ ] Container orchestration (Kubernetes - Open Source)
- [ ] Service mesh (Istio - Open Source, Linkerd - Open Source)
- [ ] API gateways (Kong - Open Source, Traefik - Open Source)

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

### Phase 10: On-Premise Cloud Infrastructure

#### 10.1 Open Source Cloud Platforms
- [ ] **OpenStack**
  - Architecture and components (Nova, Neutron, Cinder, Glance, Keystone)
  - Installation and deployment (DevStack, Kolla, Packstack)
  - Terraform provider for OpenStack
  - Networking (Neutron, floating IPs, security groups)
  - Storage (Cinder volumes, Swift object storage)
  - Identity management (Keystone)
  - Orchestration (Heat)

- [ ] **Proxmox VE**
  - Virtualization platform overview
  - Installation and cluster setup
  - VM and container management
  - Storage management (local, Ceph, ZFS)
  - Networking configuration
  - Backup and replication
  - High availability

- [ ] **Other Open Source Alternatives**
  - **CloudStack** - Apache CloudStack
  - **oVirt** - Virtualization management
  - **KVM/QEMU** - Direct virtualization
  - **LXD/LXC** - Container management

#### 10.2 On-Premise Cloud Architecture
- [ ] Design on-premise cloud infrastructure
- [ ] Network architecture for private cloud
- [ ] Storage architecture (Ceph, GlusterFS, MinIO)
- [ ] High availability and redundancy
- [ ] Resource management and quotas
- [ ] Multi-tenancy and isolation

#### 10.3 Hybrid Cloud with On-Premise
- [ ] Connect on-premise cloud to public clouds
- [ ] Hybrid networking (VPN, Direct Connect alternatives)
- [ ] Data synchronization strategies
- [ ] Workload placement decisions
- [ ] Cost optimization (on-premise vs cloud)
- [ ] Disaster recovery with hybrid setup

#### 10.4 Open Source Tool Ecosystem
- [ ] **Infrastructure**: Terraform, Ansible, Pulumi
- [ ] **Containers**: Docker, Podman, containerd
- [ ] **Orchestration**: Kubernetes, Nomad
- [ ] **CI/CD**: GitLab CI, Jenkins, Tekton
- [ ] **Monitoring**: Prometheus, Grafana, VictoriaMetrics
- [ ] **Logging**: ELK Stack, Loki, Vector
- [ ] **Tracing**: Jaeger, Tempo, OpenTelemetry
- [ ] **Service Mesh**: Istio, Linkerd, Consul
- [ ] **API Gateway**: Kong, Traefik, Envoy
- [ ] **Secrets**: HashiCorp Vault, Sealed Secrets
- [ ] **Storage**: Ceph, MinIO, Longhorn

---

## 🏗️ Project Structure

This repository uses a consolidated documentation structure for better readability and navigation:

```
cloud_training/
├── README.md                    # Main overview & navigation (this file)
│
├── docs/                        # 📚 Consolidated Documentation
│   ├── 01-foundations.md        # All Phase 1 content (Linux, Networking, Development)
│   ├── 02-infrastructure.md     # All Phase 2 content (Ansible, Terraform, Docker, K8s)
│   ├── 03-cloud-platforms.md   # All Phase 3 content (AWS, GCP, Azure)
│   ├── 04-multi-cloud-architecture.md
│   ├── 05-ci-cd-automation.md
│   ├── 06-security-compliance.md
│   ├── 07-observability.md
│   ├── 08-application-development.md
│   ├── 09-european-cloud-alternatives.md
│   └── 10-on-premise-cloud.md
│
├── exercises/                   # 💻 Practical Exercises (organized by phase)
│   └── (to be organized)
│
├── examples/                    # 📝 Code Examples
│   └── (to be organized)
│
├── scripts/                     # 🔧 Utility Scripts
│   └── consolidate_docs.py
│
└── 01-foundations/              # Directory structure for organizing exercises/examples
    ├── 01-system-administration/
    │   ├── exercises/           # Practical exercises
    │   └── examples/            # Code examples
    └── ...
```

### Documentation Structure

**All learning content is consolidated in the `docs/` directory:**
- One comprehensive file per phase
- Easy to read, search, and navigate
- Better for sharing and learning
- All content in one place per topic

**Directory structure is kept for:**
- Organizing exercises and practical work
- Storing code examples
- Personal notes and progress tracking
- Project-specific files

### Quick Navigation

- **[Phase 1: Foundations](./docs/01-foundations.md)** - Linux, Networking, Development Basics
- **[Phase 2: Infrastructure](./docs/02-infrastructure.md)** - Ansible, Terraform, Docker, Kubernetes
- **[Phase 3: Cloud Platforms](./docs/03-cloud-platforms.md)** - AWS, GCP, Azure
- **[Phase 4: Multi-Cloud Architecture](./docs/04-multi-cloud-architecture.md)**
- **[Phase 5: CI/CD & Automation](./docs/05-ci-cd-automation.md)**
- **[Phase 6: Security & Compliance](./docs/06-security-compliance.md)**
- **[Phase 7: Observability](./docs/07-observability.md)**
- **[Phase 8: Application Development](./docs/08-application-development.md)**
- **[Phase 9: European Cloud Alternatives](./docs/09-european-cloud-alternatives.md)**
- **[Phase 10: On-Premise Cloud Infrastructure](./docs/10-on-premise-cloud.md)** - OpenStack, Proxmox, Open Source Cloud

---

## 📖 Learning Resources

### Inspiration Sources
- [Stéphane Robert - DevSecOps Training](https://blog.stephane-robert.info/docs/)
- [Xavki - GitLab Training](https://gitlab.com/xavki/gitlabV2/-/tree/master)

### Additional Resources
- Cloud provider official documentation
- Terraform/OpenTofu documentation
- Kubernetes documentation
- CNCF landscape (open source cloud tools)
- OpenStack documentation
- Proxmox documentation

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
- [ ] Phase 10: On-Premise Cloud Infrastructure

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
   - **Virtual Machine (Recommended)** - Safe learning environment
     - See: [Virtual Machine Setup Guide](./SETUP_GUIDE.md)
     - VirtualBox (macOS/Linux)
     - Ubuntu Server 22.04 LTS recommended
   - **OR** Linux system (if you're comfortable)
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

1. **Set Up Your Environment** (First Time Only)
   - Follow: [Virtual Machine Setup Guide](./SETUP_GUIDE.md)
   - Create a VM with Ubuntu Server 22.04 LTS
   - Create your first snapshot
2. **Start with Documentation**: Read the consolidated docs in `docs/` directory
   - Begin with [Phase 1: Foundations](./docs/01-foundations.md)
   - Each phase has one comprehensive file with all topics
3. **Follow the Learning Path**: Work through phases sequentially
4. **Complete Exercises**: Use the `exercises/` directory for practical work
5. **Review Examples**: Check `examples/` for code samples
6. **Document Progress**: Add your notes and learnings in the phase directories
7. **Track Your Progress**: Use the checkboxes in the main README

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

