resource "kubernetes_namespace" "weather_app" {
  metadata {
    name = "${var.project_name}-${var.environment}"
  }
}

resource "kubernetes_secret" "redis_credentials" {
  metadata {
    name      = "redis-credentials"
    namespace = kubernetes_namespace.weather_app.metadata[0].name
  }

  data = {
    REDIS_HOST     = var.redis_host
    REDIS_PORT     = var.redis_port
    REDIS_PASSWORD = var.redis_primary_key
  }
}

resource "kubernetes_deployment" "weather_app" {
  metadata {
    name      = "weather-app"
    namespace = kubernetes_namespace.weather_app.metadata[0].name
    labels = {
      app = "weather-app"
    }
  }

  spec {
    replicas = var.replicas

    selector {
      match_labels = {
        app = "weather-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "weather-app"
        }
      }

      spec {
        container {
          image = "${var.acr_login_server}/weather-app:${var.image_tag}"
          name  = "weather-app"

          port {
            container_port = 3000
          }

          env_from {
            secret_ref {
              name = kubernetes_secret.redis_credentials.metadata[0].name
            }
          }

          resources {
            limits = {
              cpu    = "500m"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "256Mi"
            }
          }

          liveness_probe {
            http_get {
              path = "/health"
              port = 3000
            }
            initial_delay_seconds = 30
            period_seconds        = 10
          }

          readiness_probe {
            http_get {
              path = "/health"
              port = 3000
            }
            initial_delay_seconds = 5
            period_seconds        = 10
          }
        }

        image_pull_secrets {
          name = "acr-auth"
        }
      }
    }
  }
}

resource "kubernetes_service" "weather_app" {
  metadata {
    name      = "weather-app"
    namespace = kubernetes_namespace.weather_app.metadata[0].name
  }

  spec {
    selector = {
      app = kubernetes_deployment.weather_app.metadata[0].labels.app
    }

    port {
      port        = 80
      target_port = 3000
    }

    type = "LoadBalancer"
  }
}

resource "kubernetes_horizontal_pod_autoscaler" "weather_app" {
  metadata {
    name      = "weather-app"
    namespace = kubernetes_namespace.weather_app.metadata[0].name
  }

  spec {
    max_replicas = 10
    min_replicas = 1

    scale_target_ref {
      api_version = "apps/v1"
      kind        = "Deployment"
      name        = kubernetes_deployment.weather_app.metadata[0].name
    }

    target_cpu_utilization_percentage = 80
  }
}
