# In general I am not a big fan of the terraform_remote_state data source to get another modules
# output values because it tightly couples two Terraform modules into one dependency.
# Even Hashicorp does not recommend using the remote_state data source
# https://www.terraform.io/language/state/remote-state-data
#
# I usually prefer storing the shared data in Parameter Store or querying AWS itself for the info
# I use it here only as a Terraform example and to contrast it with the Terragrunt output dependency block
#
# In Terragrunt, you can use the "dependency" block to pass outputs between modules
# See terragrunt/_envcommon/iam.hcl for an example
# # https://terragrunt.gruntwork.io/docs/features/execute-terraform-commands-on-multiple-modules-at-once/#passing-outputs-between-modules
data "terraform_remote_state" "lookup_iam_module" {
  backend = "s3"
  # Notice the cut and paste you have to do to duplicate the s3 backend info
  # from s3/provider.tf
  config = {
    bucket = "soapbox-terraform-tfstate-s3-dev"
    region = "us-east-1"
    key    = "iam/terraform.tfstate"
  }
}