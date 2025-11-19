# Phase 9: European Cloud Alternatives

## Overview



## Table of Contents

  - [Overview](#overview)
  - [Learning Objectives](#learning-objectives)
  - [Structure](#structure)
  - [Prerequisites](#prerequisites)
  - [Estimated Time](#estimated-time)
  - [Key Concepts](#key-concepts)
  - [Providers](#providers)
  - [Purpose](#purpose)
  - [Topics Covered](#topics-covered)
  - [Learning Resources](#learning-resources)
  - [Practical Exercises](#practical-exercises)
  - [Notes](#notes)
  - [Multi-Cloud European](#multi-cloud-european)
- [Multi-Cloud with European Providers](#multi-cloud-with-european-providers)
  - [Purpose](#purpose)
  - [Topics Covered](#topics-covered)
    - [4. Compliance](#4-compliance)
  - [Learning Resources](#learning-resources)
  - [Practical Exercises](#practical-exercises)
  - [Notes](#notes)

---


Learn European cloud providers as alternatives to AWS, GCP, and Azure. Understand their services, how to use them with Terraform, and how to replicate your multi-cloud architecture using European providers.

## Learning Objectives

By the end of this phase, you should be able to:
- Understand European cloud provider offerings
- Provision infrastructure on OVH, Scaleway, and Outscale
- Replicate multi-cloud architecture on European clouds
- Understand data sovereignty and compliance considerations
- Design hybrid architectures with US and European clouds

## Structure

This phase covers two main areas:
- **European Cloud Providers** - Individual European cloud providers (OVH, Scaleway, Outscale)
- **Multi-Cloud with European Providers** - Multi-cloud strategies with European clouds

## Prerequisites

- Phase 3: Cloud Platforms completed
- Phase 4: Multi-Cloud Architecture completed
- Terraform knowledge
- Understanding of cloud architecture patterns

## Estimated Time

- Providers: 4-6 weeks
- Multi-Cloud European: 2-3 weeks

**Total: 6-9 weeks**

## Key Concepts

- **Data Sovereignty**: Data stored within specific jurisdictions
- **GDPR Compliance**: European data protection regulation
- **European Cloud Providers**: OVH, Scaleway, Outscale
- **Hybrid US/EU**: Combining US and European clouds
- **Compliance**: Meeting European regulatory requirements

---

**Previous Phase:** [Phase 8: Application Development](../08-application-development/)



---

## Providers

## Purpose

Learn the major European cloud providers: OVHcloud, Scaleway, and Outscale. Understand their services, how they compare to AWS/GCP/Azure, and how to use them.

## Topics Covered

### 1. OVHcloud
- **Services Overview**
  - Compute: Public Cloud, Private Cloud
  - Storage: Object Storage, Block Storage
  - Networking: vRack, Load Balancer, IP
  - Databases: Managed databases
  - Security: IAM, DDoS protection
- **Terraform Provider**: OVH provider
- **Integration Patterns**: How to integrate with other clouds
- **Use Cases**: When to use OVHcloud

### 2. Scaleway
- **Services Overview**
  - Compute: Instances, Kubernetes (Kapsule)
  - Storage: Object Storage, Block Storage
  - Networking: Private Networks, Load Balancers
  - Databases: Managed databases
  - Serverless: Functions, Containers
- **Terraform Provider**: Scaleway provider
- **Integration Patterns**: Multi-cloud integration
- **Use Cases**: When to use Scaleway

### 3. Outscale
- **Services Overview**
  - Compute: Virtual Machines
  - Storage: Object Storage, Block Storage
  - Networking: Virtual Private Cloud
  - Databases: Managed databases
- **Terraform Provider**: Outscale provider
- **Integration Patterns**: Integration strategies
- **Use Cases**: When to use Outscale

### 4. Comparison Matrix
- Service comparison with AWS/GCP/Azure
- Pricing models
- Feature parity
- Strengths and weaknesses

## Learning Resources

- OVHcloud documentation
- Scaleway documentation
- Outscale documentation
- Terraform provider documentation

## Practical Exercises

1. Set up accounts on European cloud providers
2. Provision basic infrastructure on each
3. Use Terraform to manage resources
4. Compare services with AWS/GCP/Azure
5. Document differences and use cases

## Notes

Document your learnings:
- Service comparisons
- Terraform configurations
- Integration patterns
- Use case analysis
- Pricing considerations

---

**Next Section:** Multi-Cloud with European Providers

---

## Multi-Cloud European

# Multi-Cloud with European Providers

## Purpose

Learn to replicate your multi-cloud architecture using European cloud providers and design hybrid architectures combining US and European clouds.

## Topics Covered

### 1. Replicating Architecture
- Porting AWS/GCP/Azure architecture to European clouds
- Service mapping and alternatives
- Architecture adaptation
- Testing and validation

### 2. Hybrid US/EU Scenarios
- Combining US clouds (AWS/GCP/Azure) with European clouds
- Data residency requirements
- Cross-continent connectivity
- Latency considerations

### 3. Data Sovereignty
- What is data sovereignty
- GDPR requirements
- Data localization
- Compliance considerations
- Data transfer regulations

### 4. Compliance
- **GDPR**: General Data Protection Regulation
- Data processing agreements
- Data residency requirements
- Compliance frameworks
- Audit and reporting

### 5. Architecture Patterns
- EU-only deployment
- US/EU hybrid deployment
- Data replication strategies
- Disaster recovery across continents

## Learning Resources

- GDPR documentation
- Data sovereignty guides
- European cloud architecture patterns
- Compliance frameworks

## Practical Exercises

1. Replicate your application on European clouds
2. Design a hybrid US/EU architecture
3. Implement data sovereignty controls
4. Set up cross-continent connectivity
5. Create compliance documentation
6. Test disaster recovery scenarios

## Notes

Document your learnings:
- Architecture diagrams
- Compliance procedures
- Data flow diagrams
- Connectivity configurations
- Lessons learned

---

**Congratulations!** You've completed the full learning path. You now have the knowledge to design, build, and operate applications on hybrid multi-cloud infrastructure across US and European cloud providers.

---