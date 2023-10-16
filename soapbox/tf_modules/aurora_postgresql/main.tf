# ----------------------------------------------------------------------------------------------------------------------
# RDS Aurora PSQL Module
# ----------------------------------------------------------------------------------------------------------------------

module "aurora_postgresql" {
  source  = "terraform-aws-modules/rds-aurora/aws"
  version = "8.3.1"

  name                        = local.aurora_name
  engine                      = "aurora-postgresql"
  engine_version              = var.aurora_version
  master_username             = "postgres"
  manage_master_user_password = true
  instance_class              = var.aurora_instance_class
  instances = {
    1 = {}
    2 = {}
  }

  vpc_id               = data.aws_vpc.env_vpc.id
  db_subnet_group_name = local.database_subnet_group_name
  security_group_rules = {
    vpc_ingress = {
      cidr_blocks = [for s in data.aws_subnet.private_vpc_subnet : s.cidr_block]
    }
  }

  vpc_security_group_ids = [
    aws_security_group.quicksight-rds-allow.id,
    aws_security_group.rds-ec2-1.id,
  ]

  autoscaling_enabled            = true
  autoscaling_policy_name        = local.autoscaling_policy_name
  autoscaling_min_capacity       = var.aurora_autoscaling_min_capacity
  autoscaling_max_capacity       = var.aurora_autoscaling_max_capacity
  autoscaling_target_cpu         = var.aurora_autoscaling_target_cpu
  autoscaling_scale_in_cooldown  = 300
  autoscaling_scale_out_cooldown = 300

  performance_insights_enabled          = var.aurora_performance_insights_enabled
  performance_insights_retention_period = var.aurora_performance_insights_retention_period

  monitoring_interval           = 60
  iam_role_name                 = "${local.aurora_name}-monitor"
  iam_role_use_name_prefix      = true
  iam_role_description          = "${local.aurora_name} RDS enhanced monitoring IAM role"
  iam_role_path                 = "/autoscaling/"
  iam_role_max_session_duration = 7200

  preferred_maintenance_window = var.aurora_preferred_maintenance_window
  preferred_backup_window      = var.aurora_preferred_backup_window
  backup_retention_period      = var.aurora_backup_retention_period

  apply_immediately   = true
  skip_final_snapshot = true

  enabled_cloudwatch_logs_exports = ["postgresql"]

  tags = var.tags
}
