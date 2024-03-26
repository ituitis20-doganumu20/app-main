#!/bin/bash

# Initialize Kubernetes cluster on the Master node
sudo kubeadm init --pod-network-cidr=10.244.0.0/16

# Configure kubectl for the current user
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# Install a pod network addon (Flannel in this case)
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

# (Optional) Allow scheduling pods on the Master node
kubectl taint nodes --all node-role.kubernetes.io/master-

# (Optional) Verify nodes are ready
kubectl get nodes
