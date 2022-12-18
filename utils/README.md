## HOW TO:
The current repo uses `Cloud Deploy` to automatically deploy to a kubernetes cluster, in order to do that first create a k8s cluster named `gke-cluster-dev`, then create a cloud deploy config using the following steps:

Create cloud deploy from `clouddeploy.yaml` config file
```shell
gcloud deploy apply --file clouddeploy.yaml --region=europe-west3 --project=cube-render-farm
```
that's it!

In order to destroy cloud deploy pipeline, first destroy the target:
```shell
gcloud deploy targets delete qsdev --region=europe-west3
```
Then delete the pipeline:
```shell
gcloud deploy delivery-pipelines delete gke-cluster-deploy-pipeline --force --region=europe-west3 --project=cube-render-farm
```