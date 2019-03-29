#!/bin/bash

set -o errexit
source $(pwd)/config

# setup cluster info
gcloud config set core/project $project_name
gcloud config set compute/region $region
gcloud config set compute/zone $zone

gcloud container clusters create $cluster_name \
    --image-type=COS                           \
    --machine-type=$machine_type               \
    --network=$network                         \
    --zone=$zone                               \
    --node-locations=$zones                    \
    --cluster-version=$cluster_version         \
    --node-version=$node_version               \
    --tags=$cluster_name                       \
    --disk-size $disk_size                     \
    --num-nodes=$num_nodes                     \
    --scopes=$scopes                           \
    --maintenance-window=$maintenance_window   \
    --enable-cloud-monitoring                  \
    --no-issue-client-certificate              \
    --no-enable-autoscaling                    \
    --no-enable-cloud-logging                  \
    --no-enable-autoupgrade                    \
    --no-enable-basic-auth                     \
    --no-enable-ip-alias

gcloud config set container/cluster $cluster_name
gcloud container clusters get-credentials $cluster_name
