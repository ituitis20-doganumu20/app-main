#!/bin/bash

# Replace the following variables with the values provided by the output of 'kubeadm init' on the Master node
MASTER_IP="MASTER_NODE_IP"
TOKEN="TOKEN"
DISCOVERY_HASH="DISCOVERY_HASH"

# Join the Worker node to the Kubernetes cluster
sudo kubeadm join ${MASTER_IP}:6443 --token ${TOKEN} --discovery-token-ca-cert-hash ${DISCOVERY_HASH}
