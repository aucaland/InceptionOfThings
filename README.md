# Inception-of-Things (IoT)

## Summary
This project is a system administration exercise designed to introduce Kubernetes (K8s) through K3s and K3d with Vagrant.

## Mandatory Parts

### Part 1: K3s and Vagrant
- Set up two virtual machines using Vagrant with minimal resources (1 CPU, 512 MB or 1024 MB RAM).
- Machines should have dedicated IPs (`192.168.56.110` for Server, `192.168.56.111` for ServerWorker).
- SSH access should be configured without a password.
- Install K3s: Server in controller mode, ServerWorker in agent mode.
- Use `kubectl` for management.

### Part 2: K3s and Three Simple Applications
- Set up a single VM with K3s in server mode.
- Deploy three web applications accessible by hostname (`app1.com`, `app2.com`, `app3.com`).
- Ensure application #2 has three replicas.

### Part 3: K3d and Argo CD
- Install K3d (requires Docker).
- Set up a CI/CD pipeline using Argo CD.
- Create two namespaces: `argocd` for Argo CD and `dev` for an application.
- Deploy an application with two versions, using GitHub for configuration and DockerHub for images.
- Argo CD should automatically update the application based on repository changes.
