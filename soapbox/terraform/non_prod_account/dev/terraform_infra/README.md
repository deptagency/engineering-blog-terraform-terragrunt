This Terraform configuration creates

* AWS S3 bucket to store Terraform state
* AWS DynamoDB table for Terraform state locking, 
  preventing multiple people from changing state at the same time

This config is a bit odd in that you need to create the Terraform infrastructure using local state first
then you can use it as a Terraform backend datastore.

Steps to Run
1. `terraform init`
2. `terraform apply`. Enter "yes" to create backend infra
3. Uncomment the  _**backend "s3"**_ section in providers.tf
4. Run ` terraform init -migrate-state` to migrate local Terraform state to the newly created remote state
