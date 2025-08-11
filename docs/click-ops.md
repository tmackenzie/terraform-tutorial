# Click Ops

Handful of click ops to get terraform working in GCP with it's state stored in a GCS bucket. This approach allows for a [service account](https://cloud.google.com/docs/terraform/authentication) to be used when using `terraform`. Taken from the [GCP instructions](https://cloud.google.com/docs/terraform/resource-management/store-state).


## Create a project

```bash
gcloud auth login
gcloud projects create YOUR_PROJECT_ID
gcloud config set project YOUR_PROJECT_ID
gcloud services enable storage.googleapis.com
```

## Create the devops-admin role

This is the role that the service account will use to provision resources in the project.

```bash
gcloud iam roles create devOpsAdmin --project=PROJECT_ID \
    --file=roles/devOpsAdmin.yaml
```

## Create a service account for terraform

This is the service account to use with `terraform`.

```bash
gcloud iam service-accounts create ci-cd-terraform
gcloud projects add-iam-policy-binding YOUR_PROJECT_ID --member="serviceAccount:ci-cd-terraform@PROJECT_ID.iam.gserviceaccount.com" --role=projects/YOUR_PROJECT_ID/roles/devOpsAdmin
```

## Project Variables

Create the file `terraform.tfvars` with the contents:
```
project_id=YOUR_PROJECT_ID
```

### Execute terraform

The original account authenticated with must have the role, `Service Account Token Creator`.

```bash
gcloud auth application-default login --impersonate-service-account ci-cd-terraform@YOUR_PROJECT_ID.iam.gserviceaccount.com
terraform init
terraform apply
terraform init -migrate-state
```