# Phase 10: On-Premise Cloud Infrastructure

## Overview

Learn to build and manage your own private cloud infrastructure using open source technologies. This phase covers OpenStack, Proxmox, and other open source cloud platforms, enabling you to run cloud workloads on your own infrastructure.

## Learning Objectives

By the end of this phase, you should be able to:
- Understand on-premise cloud architecture and components
- Deploy and manage OpenStack infrastructure
- Set up and configure Proxmox VE
- Design hybrid cloud architectures (on-premise + public cloud)
- Use open source tools for complete cloud stack
- Make informed decisions about on-premise vs cloud deployment

## Prerequisites

- Phase 1-9 completed (or equivalent knowledge)
- Strong Linux system administration skills
- Understanding of virtualization concepts
- Network administration knowledge
- Access to physical servers or powerful VMs for testing

## Estimated Time

- OpenStack: 4-6 weeks
- Proxmox: 2-3 weeks
- Hybrid Cloud: 2-3 weeks

**Total: 8-12 weeks**

---

## Open Source Cloud Platforms

### Why On-Premise Cloud?

- **Data Sovereignty**: Keep data on-premise for compliance
- **Cost Control**: Predictable costs, no vendor lock-in
- **Customization**: Full control over infrastructure
- **Hybrid Strategy**: Combine on-premise and public cloud
- **Learning**: Deep understanding of cloud internals
- **Open Source**: No licensing costs, community support

---

## 1. OpenStack

### What is OpenStack?

OpenStack is an open source cloud computing platform that provides Infrastructure as a Service (IaaS). It's used by many organizations to build private and public clouds.

### Core Components

#### Compute (Nova)
- Virtual machine management
- Hypervisor support (KVM, QEMU, VMware, etc.)
- Instance scheduling and placement
- Live migration

#### Networking (Neutron)
- Virtual networks and subnets
- Floating IPs
- Security groups
- Load balancers
- VPN services

#### Storage
- **Cinder**: Block storage (volumes)
- **Swift**: Object storage (S3-like)
- **Glance**: Image service (VM images)

#### Identity (Keystone)
- Authentication and authorization
- Service catalog
- User and project management
- Token management

#### Dashboard (Horizon)
- Web-based management interface
- User and admin dashboards
- Resource management

#### Orchestration (Heat)
- Infrastructure as Code
- Template-based resource provisioning
- Auto-scaling

#### Other Services
- **Ceilometer**: Telemetry and metering
- **Trove**: Database as a Service
- **Sahara**: Big Data as a Service
- **Magnum**: Container orchestration (Kubernetes, Docker Swarm)

### Installation Options

#### DevStack (Development/Testing)
```bash
# Quick setup for development
git clone https://opendev.org/openstack/devstack
cd devstack
./stack.sh
```

#### Kolla (Containerized Deployment)
```bash
# Production-ready containerized deployment
git clone https://opendev.org/openstack/kolla-ansible
cd kolla-ansible
# Configure and deploy
```

#### Packstack (RHEL/CentOS)
```bash
# All-in-one installer for RHEL/CentOS
yum install -y openstack-packstack
packstack --allinone
```

### Terraform with OpenStack

```hcl
# Example: Provision instance with OpenStack
terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.48"
    }
  }
}

provider "openstack" {
  auth_url    = "http://controller:5000/v3"
  user_name   = "admin"
  password    = var.openstack_password
  tenant_name = "admin"
  domain_name = "default"
}

resource "openstack_compute_instance_v2" "web" {
  name      = "web-server"
  image_id  = var.ubuntu_image_id
  flavor_id = var.small_flavor_id
  key_pair  = "my-keypair"
  
  network {
    name = "private-network"
  }
  
  security_groups = ["default", "web"]
}
```

### Learning Path

1. **Understanding Architecture**
   - OpenStack architecture overview
   - Component interactions
   - Service communication

2. **Installation**
   - Choose installation method
   - Set up development environment
   - Configure basic services

3. **Core Services**
   - Create and manage instances (Nova)
   - Set up networking (Neutron)
   - Manage storage (Cinder, Swift)
   - Configure identity (Keystone)

4. **Advanced Topics**
   - High availability setup
   - Multi-region deployment
   - Resource quotas and limits
   - Monitoring and logging

5. **Integration**
   - Terraform provider
   - Ansible modules
   - API usage
   - CLI tools

---

## 2. Proxmox VE

### What is Proxmox?

Proxmox Virtual Environment (VE) is an open source server virtualization platform that combines KVM virtualization and LXC containers in a single platform.

### Key Features

- **Web-based Management**: Complete GUI for administration
- **KVM Virtualization**: Full virtualization support
- **LXC Containers**: Lightweight container virtualization
- **Storage Options**: Local, NFS, CIFS, GlusterFS, Ceph
- **High Availability**: Cluster support with automatic failover
- **Backup**: Built-in backup and restore
- **Networking**: Software-defined networking

### Installation

```bash
# Download Proxmox VE ISO
# Boot from ISO and follow installation wizard
# Access web interface at https://your-server:8006
```

### Basic Operations

#### Create Virtual Machine
```bash
# Via web interface or CLI
qm create 100 --name vm-ubuntu --memory 2048 --net0 virtio,bridge=vmbr0
qm importdisk 100 ubuntu-22.04.qcow2 local-lvm
qm set 100 --scsihw virtio-scsi-pci --scsi0 local-lvm:vm-100-disk-0
qm set 100 --boot c --bootdisk scsi0
qm set 100 --agent enabled=1
qm start 100
```

#### Create Container
```bash
# Download container template
pveam download local ubuntu-22.04-standard_22.04-1_amd64.tar.zst

# Create container
pct create 200 local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst \
  --hostname container1 \
  --memory 1024 \
  --cores 2 \
  --storage local-lvm
```

#### Cluster Setup
```bash
# On first node
pvecm create cluster1

# On additional nodes
pvecm add <first-node-ip>
```

### Storage Management

#### Ceph Integration
```bash
# Install Ceph
pveceph install

# Create Ceph pool
pveceph createpool <pool-name> --add-storages
```

#### ZFS Support
- Native ZFS support for snapshots
- Compression and deduplication
- RAID configurations

### Backup and Restore

```bash
# Create backup
vzdump 100 --storage local --compress zstd

# Restore backup
qmrestore /var/lib/vz/dump/vzdump-qemu-100.vma.zst 101
```

### Terraform with Proxmox

```hcl
terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "~> 2.9"
    }
  }
}

provider "proxmox" {
  pm_api_url = "https://proxmox-server:8006/api2/json"
  pm_api_token_id = var.proxmox_token_id
  pm_api_token_secret = var.proxmox_token_secret
}

resource "proxmox_vm_qemu" "web" {
  name = "web-server"
  target_node = "pve1"
  
  clone = "ubuntu-template"
  
  agent = 1
  os_type = "cloud-init"
  cores = 2
  sockets = 1
  cpu = "host"
  memory = 2048
  
  disk {
    storage = "local-lvm"
    type = "scsi"
    size = "20G"
  }
  
  network {
    model = "virtio"
    bridge = "vmbr0"
  }
}
```

---

## 3. Other Open Source Alternatives

### CloudStack

Apache CloudStack is an open source cloud orchestration platform.

**Features:**
- Multi-hypervisor support
- Network as a Service
- Storage plugins
- API-driven

**Use Cases:**
- Service provider clouds
- Enterprise private clouds
- Hybrid cloud deployments

### oVirt

oVirt is an open source virtualization management platform.

**Features:**
- KVM-based virtualization
- Web-based management
- High availability
- Live migration

**Use Cases:**
- Enterprise virtualization
- Desktop virtualization (VDI)
- Development environments

### KVM/QEMU (Direct)

Direct use of KVM/QEMU for virtualization.

**Features:**
- Full control
- Lightweight
- Linux-native

**Use Cases:**
- Simple virtualization needs
- Learning virtualization internals
- Custom solutions

### LXD/LXC

Linux containers for system containers.

**Features:**
- Lightweight containers
- Full system containers (not just apps)
- Image management
- Snapshots

**Use Cases:**
- Application containers
- System containers
- Development environments

---

## 4. On-Premise Cloud Architecture

### Design Principles

1. **Scalability**: Design for growth
2. **High Availability**: No single points of failure
3. **Security**: Network isolation, access control
4. **Performance**: Resource optimization
5. **Manageability**: Easy operations and monitoring

### Network Architecture

```
Internet
   |
   | (Public Network)
   |
[Firewall/Router]
   |
   | (DMZ Network)
   |
[Load Balancers]
   |
   | (Management Network)
   |
[Cloud Controllers]
   |
   | (Data Network)
   |
[Compute Nodes]
   |
   | (Storage Network)
   |
[Storage Nodes]
```

### Storage Architecture

#### Ceph (Distributed Storage)
- Object, block, and file storage
- Self-healing
- Scalable
- Open source

#### GlusterFS (Distributed File System)
- Scale-out file storage
- High availability
- Geo-replication

#### MinIO (Object Storage)
- S3-compatible
- High performance
- Distributed mode

#### Longhorn (Kubernetes Storage)
- Cloud-native storage
- Backup and restore
- Replication

### High Availability Setup

1. **Controller HA**: Multiple controller nodes
2. **Database HA**: MySQL/MariaDB Galera cluster
3. **Message Queue HA**: RabbitMQ cluster
4. **Load Balancer**: HAProxy or keepalived
5. **Storage HA**: Distributed storage (Ceph)

---

## 5. Hybrid Cloud with On-Premise

### Connectivity Options

#### VPN Connections
- Site-to-Site VPN
- Point-to-Site VPN
- OpenVPN, WireGuard, IPsec

#### Direct Connections
- Dedicated circuits
- MPLS
- SD-WAN

### Data Synchronization

- **Replication**: Database replication
- **Backup**: Regular backups to cloud
- **Sync**: File synchronization
- **Migration**: Workload migration

### Workload Placement

**On-Premise:**
- Sensitive data
- Predictable workloads
- Compliance requirements
- Cost-sensitive applications

**Public Cloud:**
- Variable workloads
- Global reach
- Managed services
- Development/testing

### Cost Optimization

- **On-Premise**: Fixed costs, predictable
- **Public Cloud**: Variable costs, pay-per-use
- **Hybrid**: Optimize placement based on workload

---

## 6. Open Source Tool Ecosystem

### Infrastructure as Code

- **Terraform**: Multi-cloud provisioning
- **OpenTofu**: Terraform fork (open source)
- **Ansible**: Configuration management
- **Pulumi**: Infrastructure as code (multiple languages)

### Containers

- **Docker**: Container runtime
- **Podman**: Docker alternative (rootless)
- **containerd**: Industry-standard runtime
- **CRI-O**: Kubernetes runtime

### Orchestration

- **Kubernetes**: Container orchestration
- **Nomad**: Workload orchestrator (HashiCorp)
- **Docker Swarm**: Docker native orchestration

### CI/CD

- **GitLab CI**: Integrated CI/CD
- **Jenkins**: Extensible automation
- **Tekton**: Kubernetes-native CI/CD
- **ArgoCD**: GitOps continuous delivery

### Monitoring

- **Prometheus**: Metrics collection
- **Grafana**: Visualization
- **VictoriaMetrics**: Prometheus alternative
- **Thanos**: Long-term metrics storage

### Logging

- **ELK Stack**: Elasticsearch, Logstash, Kibana
- **Loki**: Log aggregation (Grafana)
- **Vector**: Log router
- **Fluentd/Fluent Bit**: Log collectors

### Tracing

- **Jaeger**: Distributed tracing
- **Tempo**: Grafana tracing backend
- **OpenTelemetry**: Observability framework
- **Zipkin**: Distributed tracing

### Service Mesh

- **Istio**: Service mesh
- **Linkerd**: Lightweight service mesh
- **Consul**: Service networking
- **Traefik Mesh**: Traefik service mesh

### API Gateway

- **Kong**: API gateway
- **Traefik**: Reverse proxy and load balancer
- **Envoy**: Cloud-native proxy
- **Apache APISIX**: API gateway

### Secrets Management

- **HashiCorp Vault**: Secrets management
- **Sealed Secrets**: Kubernetes secrets encryption
- **SOPS**: Secrets OPerationS
- **Bitwarden**: Password manager (self-hosted)

### Storage

- **Ceph**: Distributed storage
- **MinIO**: S3-compatible object storage
- **Longhorn**: Kubernetes storage
- **Rook**: Ceph operator for Kubernetes

---

## Practical Exercises

1. **OpenStack Deployment**
   - Set up DevStack environment
   - Create and manage instances
   - Configure networking
   - Set up storage

2. **Proxmox Setup**
   - Install Proxmox VE
   - Create VMs and containers
   - Set up cluster
   - Configure storage (Ceph)

3. **Hybrid Cloud**
   - Connect on-premise to public cloud
   - Set up VPN connection
   - Replicate architecture
   - Test workload migration

4. **Complete Stack**
   - Deploy Kubernetes on OpenStack/Proxmox
   - Set up monitoring (Prometheus/Grafana)
   - Configure logging (ELK/Loki)
   - Implement CI/CD (GitLab CI/Jenkins)

---

## Learning Resources

- **OpenStack Documentation**: https://docs.openstack.org/
- **Proxmox Documentation**: https://pve.proxmox.com/pve-docs/
- **Ceph Documentation**: https://docs.ceph.com/
- **Kubernetes Documentation**: https://kubernetes.io/docs/
- **CNCF Landscape**: https://landscape.cncf.io/

---

## Notes

Document your learnings:
- OpenStack deployment experiences
- Proxmox configuration examples
- Hybrid cloud architectures
- Open source tool comparisons
- Cost analysis (on-premise vs cloud)
- Troubleshooting scenarios

---

---

## 🎯 Complete Open Source Cloud Stack

By completing all phases, you now have a complete open source cloud stack:

### Infrastructure Layer
- **Virtualization**: KVM/QEMU, Proxmox, OpenStack
- **Containers**: Docker, Podman, containerd
- **Orchestration**: Kubernetes

### Infrastructure as Code
- **Provisioning**: Terraform, OpenTofu
- **Configuration**: Ansible
- **Templates**: Heat (OpenStack)

### CI/CD
- **Pipelines**: GitLab CI, Jenkins, Tekton
- **GitOps**: ArgoCD, Flux

### Observability
- **Metrics**: Prometheus, VictoriaMetrics
- **Visualization**: Grafana
- **Logging**: ELK Stack, Loki
- **Tracing**: Jaeger, Tempo, OpenTelemetry

### Networking & Security
- **Service Mesh**: Istio, Linkerd
- **API Gateway**: Kong, Traefik
- **Secrets**: HashiCorp Vault
- **Firewall**: iptables, firewalld, UFW

### Storage
- **Object Storage**: MinIO, Swift (OpenStack)
- **Block Storage**: Ceph, Longhorn
- **File Storage**: GlusterFS, CephFS

### Benefits of Open Source Stack
- ✅ **No Vendor Lock-in**: Use any combination of tools
- ✅ **Cost Effective**: No licensing fees
- ✅ **Customizable**: Modify to fit your needs
- ✅ **Community Support**: Large communities and documentation
- ✅ **Skills Transferable**: Knowledge applies across platforms
- ✅ **Transparency**: Understand how everything works

---

**Previous Phase:** [Phase 9: European Cloud Alternatives](../09-european-cloud-alternatives/)  
**This is the final phase!** 🎉

**Congratulations!** You've completed the full hybrid multi-cloud learning path, from foundations to on-premise cloud infrastructure, all using open source tools!

