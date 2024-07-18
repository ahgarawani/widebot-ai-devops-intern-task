resource "kubernetes_service" "web_app" {
  metadata {
    name      = "web-app"
    namespace = "default"
  }

  spec {
    selector = {
      app = "web-app"
    }

    port {
      port        = 80
      target_port = 80
    }

    type = "LoadBalancer"
  }
}
