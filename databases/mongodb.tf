resource "helm_release" "mongodb" {
  name       = "mongodb"
  repository = "https://charts.helm.sh/stable"
  chart      = "mongodb"
  namespace  = "databases"

  set {
    name  = "auth.enabled"
    value = "true"
  }

  set {
    name  = "auth.rootPassword"
    value = var.mongodb_root_password
  }
}
