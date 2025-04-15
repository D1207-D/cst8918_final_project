resource "kubernetes_secret" "tls_secret" {
  metadata {
    name      = "weather-app-tls"
    namespace = "weather-app"
  }
 
  type = "kubernetes.io/tls"
 
  data = {
    "tls.crt" = var.tls_certificate
    "tls.key" = var.tls_private_key
  }
}
 
resource "kubernetes_ingress_v1" "weather_app" {
  metadata {
    name      = "weather-app-ingress"
    namespace = "weather-app"
    annotations = {
      "kubernetes.io/ingress.class" = "nginx"
    }
  }
 
  spec {
    tls {
      hosts       = [var.domain_name]
      secret_name = kubernetes_secret.tls_secret.metadata[0].name
    }
 
    rule {
      host = var.domain_name
      http {
        path {
          path = "/"
          backend {
            service {
              name = "weather-app"
              port {
                number = 3000
              }
            }
          }
        }
      }
    }
  }
}