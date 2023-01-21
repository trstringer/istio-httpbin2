#!/bin/bash -i

PARAMS="$@"

NODE_COUNT="${NODE_COUNT:-3}"
echo "Installing with node count $NODE_COUNT"

az_aks_create $NODE_COUNT
flux install

eval "helm upgrade --install istio-httpbin2 ./charts/istio-httpbin2 $PARAMS"
