# k8s-cloudvision

Setup
----

Before you start, you need to setup Google Cloud credential by following the instructions [here](https://serverless.com/framework/docs/providers/google/guide/credentials/). And replace the `your-project-id` with your Google Cloud project id in `cloudvision.yml`.

In order to access the Cloud Vision API, you will need to enable Cloud Vision API in your project.

[Enable the API](https://console.cloud.google.com/flows/enableapi?apiid=vision.googleapis.com)

Install Google Cloud command line tools:
```
curl https://sdk.cloud.google.com | bash
```

Initialize Google Cloud command line tools:
```
gcloud init
```

Install Kubernetes command line tools:
```
gcloud components install kubectl
```

Setup Google Cloud project id/instance zone:
```
gcloud config set project [PROJECT_ID]
gcloud config set compute/zone [ZONE]
```

Create cluster node:
```
gcloud container clusters create cloudvision-cluster --num-nodes=1
```

Setup credential for kubectl:
```
gcloud container clusters get-credentials cloudvision-cluster
```

Setup application credential:
```
kubectl create secret generic \
cloudvision-key \
--from-file=key.json=<PATH-TO-KEY-FILE>.json
```

Prepare Docker Image
----

Build Docker image:
```
docker build Docker/ -t gcr.io/your-project-id/cloudvision
```

Push docker image to Google Container Registry:
```
gcloud docker -- push gcr.io/your-project-id/cloudvision
```


Usage
----

Deploy deployment/service:
```
kubectl create -f cloudvision.yml
```

After deployment, you can check pod/service status:
```
kubectl get pods
kubectl get service
```

Edit deployment/service
```
kubectl edit -f cloudvision.yml
```

Delete deployment/service:
```
kubectl delete -f cloudvision.yml
```

For instance, the following `curl` command sends an image URL to Cloud function.

```
curl -H "Content-Type: application/json" -X POST \
-d '{"image_url": "https://cloud.google.com/vision/images/rushmore.jpg"}' \
YOUR_SERVICE_IP
```