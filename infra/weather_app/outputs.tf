output "app_url" {
  description = "URL of the weather application"
  value       = "http://${kubernetes_service.weather_app.status[0].load_balancer[0].ingress[0].ip}"
}

output "namespace" {
  description = "Kubernetes namespace where the application is deployed"
  value       = kubernetes_namespace.weather_app.metadata[0].name
}
