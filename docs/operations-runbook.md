# Changeis Senior Cloud Project Operations Runbook

## Purpose

This document explains how to operate, monitor, troubleshoot, and validate the AWS infrastructure used in the Changeis Senior Cloud Project.

## Environment Components

- VPC
- Public subnet
- Private subnet
- Internet Gateway
- Route tables
- EC2 web server
- Security groups
- RDS MySQL database
- S3 storage bucket
- CloudWatch alarms
- SNS notifications

## EC2 Web Server Validation

### Browser Test

Open a browser and navigate to:

http://<EC2_PUBLIC_IP>

Expected response:

Changeis Senior Cloud Project - EC2 Web Server Running

### Command Line Test

Run:

curl http://<EC2_PUBLIC_IP>

Expected output:

<h1>Changeis Senior Cloud Project - EC2 Web Server Running</h1>

### Validation Purpose

These tests confirm:

- EC2 instance is running
- Apache web server is running
- Security group allows HTTP traffic
- Route tables allow internet connectivity
- Public subnet is functioning correctly

## CloudWatch Alarm Validation

### Validate Alarm in AWS Console

1. Open CloudWatch
2. Navigate to Alarms
3. Verify the following alarm exists:

changeis-ec2-high-cpu

### Validate SNS Subscription

1. Open SNS
2. Navigate to Topics
3. Open the topic:

changeis-cloud-alerts

4. Verify the email subscription status is:

Confirmed

### Validation Purpose

These checks confirm:

- CloudWatch monitoring is active
- CPU metrics are being tracked
- SNS notifications are configured
- Alert routing is functioning properly