# Minimal test version for TFC variable detection
variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "test-project"
}

variable "environment" {
  description = "Environment (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "enable_monitoring" {
  description = "Enable monitoring features"
  type        = bool
  default     = true
}
