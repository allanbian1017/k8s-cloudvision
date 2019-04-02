#!/bin/bash

source $(pwd)/config

# build & push image
docker build Docker/ -t gcr.io/$project_name/cloudvision
gcloud docker -- push gcr.io/$project_name/cloudvision