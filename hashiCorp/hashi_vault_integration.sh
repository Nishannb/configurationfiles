#!/bin/bash

# Author: Nishan 
# Version: v1
# Creation date: Dec 6, 2023
# Sourced from: https://github.com/iam-veeramalla/terraform-zero-to-hero/blob/main/Day-7/02-vault-integration.md

# Installing gpg
sudo apt update && sudo apt install gpg

#Downloading the signing key to a new keyring
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

# Verifying the key's fingerprint
gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint

# Adding HashiCorp repo
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

# Regular Update
sudo apt update

# Installing vault 
sudo apt install vault
echo "Vault installation completed"

# Starting the Vault
echo "Vault is starting now"
vault server -dev -dev-listen-address="0.0.0.0:8200"