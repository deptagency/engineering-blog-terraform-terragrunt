# In Terraform, note the manual definition of outputs to expose data from module as a map
# Int Terragrunt, the outputs of the modules are automatically outputted
output "vpc" {
  value = module.vpc
}