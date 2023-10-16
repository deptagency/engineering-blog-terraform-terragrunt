# ----------------------------------------------------------------------------------------------------------------------
# General-use variables
# ----------------------------------------------------------------------------------------------------------------------

variable "environment_name" {
  type        = string
  description = "Name of environment"
}

variable "app_id" {
  type        = string
  description = "Name of application"
}

variable "vpc_name" {
  type        = string
  description = "Name of VPC"
}

# ----------------------------------------------------------------------------------------------------------------------
# RDS module variables
# ----------------------------------------------------------------------------------------------------------------------

variable "aurora_version" {
  type        = string
  description = "Version of Aurora PostgreSQL"
  default     = "15.3"
}

variable "aurora_instance_class" {
  type        = string
  description = "DB Instance class"
  default     = "db.t4g.large"
}

variable "aurora_autoscaling_min_capacity" {
  type        = number
  description = "Minimum number of instances in Aurora cluster"
  default     = 1
}

variable "aurora_autoscaling_max_capacity" {
  type        = number
  description = "Maximum number of instances in Aurora cluster"
  default     = 3
}

variable "aurora_performance_insights_enabled" {
  type        = bool
  description = "Enable Performance Insights"
  default     = true
}

variable "aurora_performance_insights_retention_period" {
  type        = number
  description = "Retention period for Performance Insights"
  default     = 7
}

variable "aurora_autoscaling_target_cpu" {
  type        = number
  description = "Target CPU for Aurora autoscaling"
  default     = 70
}

variable "aurora_preferred_maintenance_window" {
  type        = string
  description = "Preferred maintenance window for Aurora cluster (UTC"
  default     = "sun:09:00-sun:10:00"
}

variable "aurora_preferred_backup_window" {
  type        = string
  description = "Preferred backup window for Aurora cluster (UTC)"
  default     = "04:00-05:00"
}

variable "aurora_backup_retention_period" {
  type        = number
  description = "Backup retention period for Aurora cluster"
  default     = 7
}

variable "tags" {
  type    = map(string)
  default = {}
}
