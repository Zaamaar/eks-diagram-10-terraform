variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "eu-west-1" # closest AWS region with full EKS support to Lagos
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "diagram-10-eks"
}

variable "cluster_version" {
  description = "Kubernetes version for the EKS control plane"
  type        = string
  default     = "1.30"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "node_instance_types" {
  description = "EC2 instance types for the managed node group (worker nodes)"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "node_desired_size" {
  description = "Desired number of worker nodes"
  type        = number
  default     = 2
}

variable "node_min_size" {
  description = "Minimum number of worker nodes (floor for HPA/cluster-autoscaler)"
  type        = number
  default     = 1
}

variable "node_max_size" {
  description = "Maximum number of worker nodes (ceiling for HPA/cluster-autoscaler)"
  type        = number
  default     = 4
}
