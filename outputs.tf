output "cluster_name" {
  description = "EKS cluster name"
  value       = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "EKS control plane API endpoint"
  value       = module.eks.cluster_endpoint
}

output "cluster_certificate_authority_data" {
  description = "Base64-encoded CA cert for kubeconfig"
  value       = module.eks.cluster_certificate_authority_data
  sensitive   = true
}

output "ecr_repository_url" {
  description = "URL to push/pull container images"
  value       = aws_ecr_repository.app.repository_url
}

output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "nat_gateway_ids" {
  description = "One NAT Gateway per AZ"
  value       = module.vpc.natgw_ids
}

output "ecr_endpoint_ids" {
  description = "VPC endpoints that let worker nodes reach ECR without NAT"
  value = {
    api = aws_vpc_endpoint.ecr_api.id
    dkr = aws_vpc_endpoint.ecr_dkr.id
    s3  = aws_vpc_endpoint.s3.id
  }
}

output "kubeconfig_command" {
  description = "Run this to point kubectl at the new cluster"
  value       = "aws eks update-kubeconfig --region ${var.aws_region} --name ${module.eks.cluster_name}"
}
