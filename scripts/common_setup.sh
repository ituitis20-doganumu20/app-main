#!/bin/bash

# Update package lists and install necessary packages
sudo apt-get update
sudo apt-get install -y apt-transport-https curl

# Install Docker
sudo apt-get install -y docker.io

# Add Kubernetes apt repository and install Kubernetes components
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
