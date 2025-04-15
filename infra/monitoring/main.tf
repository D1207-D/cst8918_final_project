resource "kubernetes_namespace" "monitoring" {
  metadata {
    name = "monitoring"
  }
}
 
resource "helm_release" "prometheus" {
  name             = "prometheus"
  repository       = "[https://prometheus-community.github.io/helm-charts"](https://prometheus-community.github.io/helm-charts")
  chart            = "kube-prometheus-stack"
  namespace        = kubernetes_namespace.monitoring.metadata[0].name
  create_namespace = true
 
  set {
    name  = "grafana.adminPassword"
    value = var.grafana_admin_password
  }
 
  set {
    name  = "grafana.persistence.enabled"
    value = "true"
  }
 
  set {
    name  = "prometheus.prometheusSpec.retention"
    value = "15d"
  }
}