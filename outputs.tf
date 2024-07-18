output "kubernetes_cluster_endpoint" {
  value = module.kubernetes.endpoint
}

output "application_url" {
  value = module.networking.application_url
}
