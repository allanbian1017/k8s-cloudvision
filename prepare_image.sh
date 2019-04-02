#!/bin/bash

set -o errexit
source $(pwd)/config

# build & push image
docker build Docker/ -t gcr.io/$project_name/cloudvision
gcloud docker -- push gcr.io/$project_name/cloudvision