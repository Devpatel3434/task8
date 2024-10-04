# Your Solution
#
# Deploys the Node.js microservice to Kubernetes.
#
# Assumes the image has already been built and published to the container registry.
#
# Environment variables:
#
#   CONTAINER_REGISTRY - The hostname of your container registry.
#   VERSION - The version number of the image to deploy.
#
# Usage:
#
#   ./scripts/deploy.sh
#

set -u # or set -o nounset
: "$CONTAINER_REGISTRY"
: "$VERSION"
: "$REGISTRY_UN"

az aks get-credentials --resource-group deakinuni --name $REGISTRY_UN --overwrite-existing

az acr update --name $REGISTRY_UN --sku Standard

az acr update --name $REGISTRY_UN --anonymous-pull-enabled true

#az aks update --resource-group $REGISTRY_UN --name $REGISTRY_UN --attach-acr $REGISTRY_UN


envsubst < ./scripts/kubernetes/deploy.yaml | kubectl apply -f -