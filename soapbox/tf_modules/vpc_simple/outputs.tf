output "vpc_id" {
  value = module.vpc_simple.vpc_id
}

output "azs" {
  value = module.vpc_simple.azs
}

output "public_subnet_arns" {
  value = module.vpc_simple.public_subnet_arns
}

output "vpc_simple" {
  value = module.vpc_simple
}