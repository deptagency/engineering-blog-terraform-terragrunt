# ----------------------------------------------------------------------------------------------------------------------
# ECR Repo
# ----------------------------------------------------------------------------------------------------------------------

resource "aws_ecr_repository" "this" {
  for_each = toset(var.ecr_repo_names)

  name                 = each.key
  image_tag_mutability = var.is_image_mutable ? "MUTABLE" : "IMMUTABLE"
  force_delete         = var.force_delete


  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }

  tags = var.tags
}