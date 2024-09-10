# E-Commerce Architecture on Google Cloud Platform (GCP)

## Version History

| Version Number | Name            | Date       |
|----------------|-----------------|------------|
| 1.0            | Initial Design  | 2024-09-10 |

## Overview

This repository contains the infrastructure setup and configuration for a scalable and secure e-commerce application on Google Cloud Platform (GCP) without using Kubernetes. The architecture leverages managed services such as Cloud Run, App Engine, Cloud SQL, and more to simplify operations and enhance scalability.

## Architecture Components

1. **Networking Setup: Custom VPC**
   - **Custom VPC**: Defines network boundaries and control.
   - **Subnets**: Separate environments (development, staging, production).
   - **Firewall Rules**: Controls traffic between services and restricts external access.
   - **Cloud NAT**: Provides secure internet access without exposing private IPs.

2. **Compute Layer: Cloud Run and App Engine**
   - **Backend Microservices**: Deployed on Cloud Run, utilizing Docker images stored in Artifact Registry.
   - **Frontend Application**: Hosted on App Engine Standard with CI/CD automation via Cloud Build.

3. **Storage and Databases**
   - **Cloud SQL (Postgres)**: Provides managed relational database services with private IP.
   - **Cloud Storage**: Stores static assets like product images and user uploads.
   - **Firestore**: For real-time, scalable NoSQL storage needs.

4. **CI/CD Pipeline: Cloud Build and Artifact Registry**
   - **Cloud Build**: Automates builds, tests, and deployments.
   - **Artifact Registry**: Stores Docker images for backend services.

5. **Load Balancing and Traffic Management**
   - **Cloud Load Balancer**: Routes traffic to Cloud Run services with path-based or header-based routing.

6. **Monitoring and Logging**
   - **Cloud Monitoring**: Visualizes metrics like request latency and error rates.
   - **Cloud Logging**: Captures detailed application logs and alerts for issues.

7. **Security Configurations**
   - **IAM Roles and Policies**: Implements least privilege access for services.
   - **Cloud Armor**: Protects against web attacks and DDoS threats.
   - **Secret Manager**: Stores and manages sensitive information securely.

8. **Infrastructure as Code with Terraform**
   - **Terraform Scripts**: Defines and manages infrastructure components including VPC, Cloud Run, Cloud SQL, Cloud Storage, IAM configurations, and more.