
variable "eks_cluster_id" {
  description = "trigger for null resource using eks_cluster_id"
}

variable "modify_existing_resource" {
  description = "Run script to modify_existing_resource"
  type        = bool
  default     = false
}