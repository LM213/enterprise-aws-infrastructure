# Changeis Senior Cloud Project

## Overview

This project simulates a secure enterprise AWS environment using Terraform Infrastructure-as-Code, operational monitoring, incident response workflows, and modular cloud architecture design.

The environment was built to strengthen real-world AWS Cloud Engineering skills through hands-on deployment, troubleshooting, monitoring, and operational validation.

## Core Technologies

- AWS
- Terraform
- EC2
- RDS MySQL
- S3
- CloudWatch
- SNS
- IAM
- Git
- Linux
- Apache HTTP Server

## Architecture Features

- Custom VPC networking
- Public and private subnet segmentation
- Internet Gateway and route tables
- Security group isolation
- EC2 web application hosting
- Private RDS database deployment
- Secure S3 storage
- CloudWatch monitoring and SNS alerting
- Incident simulation and remediation
- Operational documentation and runbooks

## Architecture Summary

### Networking

- Dedicated VPC using CIDR range `10.0.0.0/16`
- Public subnet for internet-facing resources
- Private subnet for internal database resources
- Internet Gateway for external connectivity
- Public and private route tables

### Compute

- Amazon EC2 web server running Amazon Linux 2023
- Apache HTTP Server installed automatically using EC2 user data
- HTTP access controlled through Security Groups

### Database

- Amazon RDS MySQL deployed in the private subnet
- Database access restricted to the application security group
- Public database access disabled

### Storage

- Amazon S3 bucket with:
  - Block Public Access enabled
  - Server-side encryption enabled
  - Versioning enabled

### Monitoring

- CloudWatch CPU alarm for EC2 monitoring
- SNS email notifications for alert delivery
- Operational monitoring validation procedures

### Incident Response

- Simulated production outage using Security Group misconfiguration
- Root cause analysis and incident documentation completed
- Service restoration validated after remediation
## Skills Demonstrated

### AWS Infrastructure

- VPC design and subnet segmentation
- Route table and Internet Gateway configuration
- EC2 provisioning and configuration
- RDS MySQL deployment
- S3 secure storage configuration
- CloudWatch monitoring and alerting
- SNS notification integration

### Infrastructure-as-Code

- Modular Terraform architecture
- Terraform variables and outputs
- Provider configuration
- Resource dependency management
- Infrastructure validation and planning workflows

### Security

- Security Group isolation
- Private database deployment
- Principle of least privilege
- Encryption at rest
- Public access restriction

### Operations and Troubleshooting

- Infrastructure validation
- Monitoring verification
- Incident simulation
- Root cause analysis
- Operational documentation
- Service restoration validation

### DevOps Practices

- Git version control
- Infrastructure documentation
- Operational runbooks
- Incident management workflows
## Deployment Instructions

### Prerequisites

- AWS account
- AWS CLI configured
- Terraform installed
- Git installed

### Clone Repository

```bash
git clone <repository-url>
cd <repository-folder>
## Cleanup Warning

This project creates billable AWS resources, including EC2, RDS, S3, CloudWatch, and SNS.

To avoid ongoing AWS charges, destroy the infrastructure when finished:

```bash
cd terraform
terraform destroy