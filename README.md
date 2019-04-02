# k8s-cloudvision

## Setup

Before you start, you need to replace the `your-project-id` with your Google Cloud project id in `cloudvision.yml` and `config`.

Install Google Cloud command line tools:

```bash
curl https://sdk.cloud.google.com | bash
```

Initialize Google Cloud command line tools:

```bash
gcloud init
```

Install Kubernetes command line tools:

```bash
gcloud components install kubectl
```

Create GKE cluster:

```bash
./create_cluster.sh
```

In order to access the Cloud Vision API, you will need to enable Cloud Vision API in your project. Be sure to download credential file to local.

[Enable the API](https://console.cloud.google.com/flows/enableapi?apiid=vision.googleapis.com)

Setup Cloud Vision API credential:

```bash
kubectl create secret generic cloudvision-key --from-file=key.json=<PATH-TO-KEY-FILE>.json
```

Prepare Docker image:

```bash
./prepare_image.sh
```

## Usage

Deploy deployment/service:

```bash
kubectl create -f cloudvision.yml
```

After deployment, you can check pod/service status:

```bash
kubectl get pods
kubectl get svc
```

Apply deployment/service

```bash
kubectl apply -f cloudvision.yml
```

Delete deployment/service:

```bash
kubectl delete -f cloudvision.yml
```

## Test

For instance, the following `curl` command sends an image URL to service:

```bash
curl -H "Content-Type: application/json" -X POST
-d '{"image_url": "https://cloud.google.com/vision/images/rushmore.jpg"}' YOUR_SERVICE_IP
```