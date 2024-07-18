resource "helm_release" "sqlserver" {
  name       = "sqlserver"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "mssql"
  namespace  = "databases"

  set {
    name  = "sa.password"
    value = var.sqlserver_sa_password
  }
}
