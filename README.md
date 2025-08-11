# Terraform for a Hugo Project

This follows the [small project](https://github.com/antonbabenko/terraform-best-practices/tree/master/examples/small-terraform) code structure recommended by [terraform best practices]((https://www.terraform-best-practices.com/examples)).

## Click Ops

The needed [click-ops](docs/click-ops.md) to get the project initialized in GCP.

## Remote State

the `backend.tf` is generated in [main.tf](main.tf) after the GCS bucket is created. Its generated there because the bucket is a dependency to the backend.

## Index
 - [Code Structure](https://www.terraform-best-practices.com/code-structure)
 - [Examples](https://www.terraform-best-practices.com/examples)
 - [Custom Roles](https://cloud.google.com/iam/docs/creating-custom-roles#gcloud)