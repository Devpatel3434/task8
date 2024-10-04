#!/bin/bash
#
# Script to initialize, plan, and apply Terraform changes.
#
# Usage:
#
#       ./scripts/terraform-deploy.sh
#

set -e

cd terra

# Initialize Terraform
terraform init

# Generate an execution plan
terraform plan

# Apply the Terraform changes
terraform apply -auto-approve
