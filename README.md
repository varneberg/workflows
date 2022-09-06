# Github-Workflows

## Description
This is intended to be a collection of workflows and tools I have found useful while working with Github Workflows/Actions

## Contents

### docker-build-push-gcp.yaml

This workflow creates a docker image from a docker file path and pushes it to a GCP Artifact Registry repository. It uses google's auth action which in this implementation has to be set up with a Workload Identity Provider and an Identity Pool in order to use OIDC authentication. 

Because this workflow is meant to be called, in order to run it as a stand-alone workflow you must replace the upmost part with another triggering Github event:

```yaml
on:
  workflow_dispatch
env:
   APP_NAME: My app
   APP_DIR: My_App/
   DOCKERFILE_PATH:My_App/Dockerfile

# Build applications from docker images and upload to Google Artifact Registry
jobs:
  docker:
      ...
```

### helm-gcp-ar-upload.yaml

Simple workflow that lints a helm chart and uploades it to a GCP Artifact Registry repository.

### delete-workflows.sh

Simple script that deletes all previous runs of a github workflow. I found it somewhere on a forum and it works prefectly fine. I've found it useful when I have renamed a workflow and all previous runs from the prior workflow has to otherwise be deleted one by one. 
