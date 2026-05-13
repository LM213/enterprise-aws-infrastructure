# Changeis Senior Cloud Project Architecture Overview

## Project Objective

This project simulates a secure enterprise AWS environment using Infrastructure-as-Code, operational monitoring, incident response procedures, and modular Terraform design patterns.

## Core AWS Services Used

- VPC
- Subnets
- Route Tables
- Internet Gateway
- Security Groups
- EC2
- RDS MySQL
- S3
- CloudWatch
- SNS
- IAM
- Terraform

## Architecture Goals

- Secure network segmentation
- Private database deployment
- Modular Infrastructure-as-Code
- Operational monitoring and alerting
- Incident response readiness
- Enterprise-style cloud architecture

## Networking Architecture

### VPC Design

The environment uses a dedicated AWS VPC to isolate project resources inside a private cloud network.

CIDR Range:

10.0.0.0/16

### Public Subnet

The public subnet is used for internet-facing resources.

CIDR Range:

10.0.1.0/24

Resources in the public subnet:
- EC2 web server

### Private Subnet

The private subnet is used for internal resources that should not be directly exposed to the internet.

CIDR Range:

10.0.2.0/24

Resources in the private subnet:
- RDS MySQL database

### Internet Gateway

The Internet Gateway allows public subnet resources to communicate with the internet.

### Route Tables

The public route table contains a default route:

0.0.0.0/0 → Internet Gateway

The private route table does not expose private resources directly to the internet.

## Security Architecture

### Application Security Group

The application security group allows inbound HTTP traffic on TCP port 80 from the internet.

Purpose:
- Allow browser access to the EC2-hosted web application

Outbound traffic is fully allowed to enable operating system updates and outbound connectivity.

### Database Security Group

The database security group does not allow public internet access.

Inbound MySQL traffic on TCP port 3306 is allowed only from the application security group.

Purpose:
- Restrict database access to the application layer only
- Prevent direct internet exposure of the database

### S3 Security Controls

The S3 bucket includes:
- Block Public Access enabled
- Server-side encryption enabled
- Versioning enabled

Purpose:
- Protect stored data
- Prevent accidental public exposure
- Improve recovery capabilities

### Security Design Principles

The environment follows several security best practices:
- Least privilege access
- Private database deployment
- Network segmentation
- Encryption at rest
- Default-deny architecture

## Compute and Database Architecture

### EC2 Web Server

The environment uses an Amazon EC2 instance as the application compute layer.

The EC2 instance runs Amazon Linux 2023 and uses user data to automatically:

- Update operating system packages
- Install Apache HTTP Server
- Start the Apache service
- Serve a test web page

Purpose:
- Provide a simple application endpoint
- Practice compute provisioning
- Validate networking and security group behavior
- Support troubleshooting scenarios

### RDS MySQL Database

The environment uses Amazon RDS MySQL as the managed database layer.

The database is deployed in the private subnet and is not publicly accessible.

Purpose:
- Provide a managed relational database
- Practice secure database placement
- Validate app-to-database security group access
- Simulate enterprise backend infrastructure

### Traffic Flow

User traffic flows through the environment like this:

Browser → Internet Gateway → Public Route Table → Public Subnet → Application Security Group → EC2 Web Server

Database traffic follows this internal path:

EC2 Web Server → Application Security Group → Database Security Group → RDS MySQL

## Monitoring and Incident Response

### CloudWatch Monitoring

Amazon CloudWatch is used to monitor EC2 CPU utilization.

A CloudWatch alarm triggers when CPU usage exceeds 70 percent for 10 minutes.

Purpose:
- Detect abnormal server behavior
- Improve operational visibility
- Support proactive incident detection

### SNS Alerting

Amazon SNS is used to send email notifications when CloudWatch alarms trigger.

Alert flow:

CloudWatch Alarm → SNS Topic → Email Notification

Purpose:
- Notify operators of infrastructure issues
- Support operational response workflows

### Incident Simulation

A controlled incident was introduced by intentionally changing the application security group HTTP port from 80 to 81.

Impact:
- EC2 instance remained healthy
- Apache remained healthy
- Browser access failed due to blocked HTTP traffic

Resolution:
- Security group inbound rule restored to TCP port 80

### Operational Lessons

The incident demonstrated:
- Importance of security group validation
- Difference between server health and application reachability
- Need for operational troubleshooting workflows
- Importance of documentation and root cause analysis