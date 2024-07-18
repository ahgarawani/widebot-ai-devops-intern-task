resource "kubernetes_deployment" "web_app" {
  metadata {
    name      = "web-app"
    namespace = "default"
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = "web-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "web-app"
        }
      }

      spec {
        container {
          name  = "web-app"
          image = "docker/awesome-compose/aspnet-mssql:latest"

          port {
            container_port = 80
          }

          env {
            name  = "ASPNETCORE_ENVIRONMENT"
            value = "Production"
          }
        }
      }
    }
  }
}
