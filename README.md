# DevOps Multi-Container Project

## Project Overview

This project demonstrates a complete DevOps workflow using:

- Spring Boot Java Backend
- Apache Frontend
- MySQL Database
- HAProxy Load Balancer
- Docker Containers
- Terraform Infrastructure as Code
- GitHub Actions CI/CD Pipeline
- DockerHub Image Registry

The project automatically builds, pushes, and deploys containers using CI/CD.

---

# Project Architecture

```text
GitHub Push
     ↓
GitHub Actions CI/CD
     ↓
Maven Build
     ↓
Docker Image Build
     ↓
DockerHub Push
     ↓
Terraform Deploy
     ↓
Docker Containers
